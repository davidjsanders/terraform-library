resource "azurerm_network_security_rule" "rule" {
  name                        = "${var.name}"
  network_security_group_name = "${var.network-security-group-name}"
  resource_group_name         = "${var.resource-group-name}"
  priority                    = "${var.priority}"
  direction                   = "${var.direction}"
  access                      = "${var.access}"
  protocol                    = "${var.protocol}"
  source_address_prefix       = "${var.source-address-prefix}"
  source_port_range           = "${var.source-port-range}"
  destination_address_prefix  = "${var.destination-address-prefix}"
  destination_port_range      = "${var.destination-port-range}"
}
