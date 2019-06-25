output "id" {
  value = "${azurerm_network_interface.nic-with-bepool-ip.id}"
}

output "private_ip_address" {
  value = "${azurerm_network_interface.nic-with-bepool-ip.private_ip_address}"
}
