variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west3"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable disk_image {
  description = "Disk image"
}
variable private_key_path {
  description = "private_key_path"
}
variable zone {
  description = "zone"
  default     = "europe-west3-a"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable db_disk_image {
  description = "Disk image for reddit database"
  default     = "reddit-db-base"
}
variable source_ranges {
  description = "Allowed IP addresses"
  default = ["0.0.0.0/0"]
}
