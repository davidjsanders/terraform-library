output "id" {
  value = "${azurerm_public_ip.pip.id}"
}

output "fqdn" {
  value = "${azurerm_public_ip.pip.fqdn}"
}

output "ip_address" {
  value = "${azurerm_public_ip.pip.ip_address}"
}
