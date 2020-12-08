variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
  default = "/home/kot/.ssh/appuser"
}
variable zone {
  description = "zone"
  default = "europe-west3-a"
}
variable db_disk_image {
  description = "Disk image for reddit database"
  default = "reddit-db-base"
}
