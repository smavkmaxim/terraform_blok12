variable "custom_folder_id" {
  type    = string
}

variable "custom_zone" {
  type    = string
}

variable "port_list" {
  default = {
    "prod" = ["22", "80", "443"]
  }
}

variable "network-1" {
  type    = string
}

