# main.tf
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  zone = var.custom_zone
  service_account_key_file = "/opt/authorized_key.json"
}



resource "yandex_vpc_network" "network-1" {
  name = "network1"
  folder_id = var.custom_folder_id
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.19.0/24", "192.168.90.0/24"]
  folder_id = var.custom_folder_id
  zone = var.custom_zone

}
