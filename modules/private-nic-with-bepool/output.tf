output "id" {
  value = "${azurerm_network_interface.nic-with-bepool.id}"
}

output "private_ip_address" {
  value = "${azurerm_network_interface.nic-with-bepool.private_ip_address}"
}
