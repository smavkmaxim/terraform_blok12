output "security_group_name" {
  value = module.yandex_sg.security_group_name
}

output "security_group_id" {
  value = module.yandex_sg.security_group_id
}

output "vm_name" {
  value = yandex_compute_instance.vm_kma.name
  }

output "allowed_ports" {
  value = module.yandex_sg.prod_instance_ports
}
