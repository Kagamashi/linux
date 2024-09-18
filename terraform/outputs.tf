output "ubuntu_vm_public_ip" {
  description = "Public IP address of the Ubuntu VM."
  value       = azurerm_linux_virtual_machine.ubuntu_vm.public_ip_address
}

output "redhat_vm_public_ip" {
  description = "Public IP address of the Red Hat VM."
  value       = azurerm_linux_virtual_machine.redhat_vm.public_ip_address
}
