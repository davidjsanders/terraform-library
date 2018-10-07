resource "azurerm_subnet" "subnets" {
  name                      = "${var.name}"
  resource_group_name       = "${var.vnet-target-rg-name}"
  virtual_network_name      = "${var.vnet-target-name}"
  network_security_group_id = "${var.nsg-id}"

  address_prefix    = "${var.address-prefix}"
  route_table_id    = "${var.route-table-id}"
  service_endpoints = "${var.service-endpoints}"

  # TODO
  # Add route_table_id to setup route table
}
