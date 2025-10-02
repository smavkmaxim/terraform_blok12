terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  zone = var.custom_zone
  service_account_key_file = "authorized_key.json"
}


# ниже мы вызываем модуль (в нашем случае локальный)
module "yandex_vpc" {
  source     = "./modules/vpc" # путь к локальному модулю
  custom_folder_id = var.custom_folder_id
  custom_zone = var.custom_zone
}
  
module "yandex_sg" {
  source     = "./modules/security_group" # путь к локальному модулю
  custom_folder_id = var.custom_folder_id
  custom_zone = var.custom_zone
  network-1 = module.yandex_vpc.network-1
}

  
  resource "yandex_compute_instance" "vm_kma" {
  name = "vm-kma"
  zone = var.custom_zone
  folder_id = var.custom_folder_id
  platform_id = "standard-v2"
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd82sqrj4uk9j7vlki3q"
    }
  }
  network_interface {
    subnet_id = module.yandex_vpc.subnet-1
    nat       = true
  }
}
