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
module "app" {
  source          = "./modules/app"
  public_key_path = var.public_key_path
  zone            = var.zone
  app_disk_image  = var.app_disk_image
}

module "db" {
  source          = "./modules/db"
  public_key_path = var.public_key_path
  zone            = var.zone
  db_disk_image   = var.db_disk_image
}

module "vpc" {
  source          = "./modules/vpc"
  source_ranges = var.source_ranges
}