output "vm_name" {
  value = linode_instance.main.name
}

output "vm_ip" {
  value = linode_instance.main.ip_address
}