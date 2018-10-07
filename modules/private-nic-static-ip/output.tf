output "id" {
  value = "${azurerm_network_interface.nic-static-ip.id}"
}

output "private_ip_address" {
  value = "${azurerm_network_interface.nic-static-ip.private_ip_address}"
}
