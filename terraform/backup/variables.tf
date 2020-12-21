variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
  default = "/home/kot/.ssh/appuser.pub"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}
variable db_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-db-base"
}
variable zone {
  description = "zone"
  default = "europe-west3-a"
}
variable private_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable disk_image {
  # Описание переменной
  description = "disk_image"
}
variable region {
  # Описание переменной
  description = "region"
}
variable project {
  # Описание переменной
  description = "project"
}
variable source_ranges {
  description = "Allowed IP addresses"
  default = ["0.0.0.0/0"]
}