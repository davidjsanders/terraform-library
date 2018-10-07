resource "azurerm_network_security_group" "nsg" {
  location            = "${var.location}"
  name                = "${var.name}"
  resource_group_name = "${var.resource-group-name}"

  tags = "${var.tags}"
}
