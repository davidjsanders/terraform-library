resource "azurerm_virtual_network" "vnet" {
  name                      = "${var.name}"
  resource_group_name       = "${var.resource-group-name}"
  address_space             = ["${var.cidr-block}"]
  location                  = "${var.location}"
  dns_servers               = ["${var.dns-servers}"]

  tags = "${var.tags}"
}
