terraform {
  # Версия terraform
  #required_version = 0.13.5
}
provider google {
  # Версия провайдера

  # ID проекта
  project = var.project
  region  = var.region
}
resource "google_compute_instance" "app" {
  name = "reddit-app"
  machine_type = "e2-micro"
  zone = "europe-west3-a"
  tags = ["reddit-app"]
  boot_disk {
    initialize_params {image = var.disk_image}
  }

  metadata = {
    # путь до публичного ключа
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
  connection {
    type = "ssh"
    user = "appuser"
    host = self.network_interface[0].access_config[0].nat_ip
    agent = false
    private_key = file(var.private_key_path)
 }

  provisioner "file" {
  source = "files/puma.service"
  destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
  script = "files/deploy.sh"
  }

  network_interface {
  network = "default"
  access_config {
  nat_ip = google_compute_address.app_ip.address
    }
  }
}
resource "google_compute_address" "app_ip" { 
  name = "reddit-app-ip"
}
resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["9292"]
    }
  source_ranges = var.source_ranges
  target_tags = ["reddit-app"]
}
resource "google_compute_firewall" "firewall_ssh" {
  name = "default-allow-ssh"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  source_ranges = var.source_ranges
}