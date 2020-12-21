variable db_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-db-base"
}
variable private_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
  default = "/home/kot/.ssh/appuser"
}
variable zone {
  description = "Zone"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
  default = "/home/kot/.ssh/appuser.pub"
}