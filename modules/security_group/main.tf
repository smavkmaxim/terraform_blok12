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

resource "yandex_vpc_security_group" "sgroup_prod" {
  name        = "sg_kma_prod"
  description = "description for my security group"
  network_id  = var.network-1
  folder_id = var.custom_folder_id

        # настройка правил для входящего трафика через динамический блок
  dynamic "ingress" {
    for_each = var.port_list.prod
    content {
      port           = ingress.value
      protocol       = "TCP"
      v4_cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
