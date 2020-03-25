output "vm_name" {
  value = linode_instance.main.label
}

output "vm_ip" {
  value = linode_instance.main.ip_address
}
