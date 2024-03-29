resource "azurerm_subnet" "subnets" {
  name                      = "${var.name}"
  resource_group_name       = "${var.vnet-target-rg-name}"
  virtual_network_name      = "${var.vnet-target-name}"

  address_prefix    = "${var.address-prefix}"
  service_endpoints = "${var.service-endpoints}"

  # TODO
  # Add route_table_id to setup route table
}
