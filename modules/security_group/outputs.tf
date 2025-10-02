output "prod_instance_ports" {
  value = yandex_vpc_security_group.sgroup_prod.ingress[*].port
}

output "security_group_name" {
  value = yandex_vpc_security_group.sgroup_prod.name
}

output "security_group_id" {
  value = yandex_vpc_security_group.sgroup_prod.id
}
