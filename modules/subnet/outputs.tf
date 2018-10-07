output "id" {
  value = "${azurerm_subnet.subnets.id}"
}

output "ip-configuration" {
  value = "${azurerm_subnet.subnets.ip_configurations}"
}

output "name" {
  value = "${azurerm_subnet.subnets.name}"
}

output "virtual-network-name" {
  value = "${azurerm_subnet.subnets.virtual_network_name}"
}

output "address-prefix" {
  value = "${azurerm_subnet.subnets.address_prefix}"
}
