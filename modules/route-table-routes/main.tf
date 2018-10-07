# -------------------------------------------------------------------
#
# Module:         modules
# Submodule:      nsg
# Code set:       route-table.tf
# Purpose:        Create an Azure route table
# Created on:     19 May 2018
# Created by:     David Sanders
# Creator email:  david.sanders2@loblaw.ca
# Repository:     https://github.com/dsandersAzure/tf-learning
#
# -------------------------------------------------------------------

variable "resource_groups" {
  type = "list"
}

variable "route_tables" {
  type = "list"
}

variable "route_table_id_list" {
  type = "list"
}

variable "route_table_routes" {
  type = "list"
}

locals {
  foobar = "${var.route_table_id_list}"
}

resource "azurerm_route" "route-table-routes" {
  count = "${length(var.route_table_routes)}"

  #  resource_group_name    = "${var.resource_groups[element(var.route_table_routes[count.index], 1)]}"
  resource_group_name    = "${var.resource_groups[element(var.route_tables[element(var.route_table_routes[count.index], 0)], 1)]}"
  route_table_name       = "${element(var.route_tables[element(var.route_table_routes[count.index], 0)], 0)}"
  name                   = "${element(var.route_table_routes[count.index], 2)}"
  address_prefix         = "${element(var.route_table_routes[count.index], 3)}"
  next_hop_type          = "${element(var.route_table_routes[count.index], 4)}"
  next_hop_in_ip_address = "${element(var.route_table_routes[count.index], 5)}"
}

output "route_table_routes_id_list" {
  value = ["${azurerm_route.route-table-routes.*.id}"]
}
