# -------------------------------------------------------------------
#
# Module:         modules
# Submodule:      nsg
# Code set:       route-table.tf
# Purpose:        Create an Azure route table
# Created on:     19 May 2018
# Created by:     David Sanders
# Creator email:  dsanderscanada@gmail.com
# Repository:     https://github.com/dsandersAzure/tf-learning
#
# -------------------------------------------------------------------

variable "resource_groups" {
  type = "list"
}

variable "route_tables" {
  type = "list"
}

variable "location" {}

variable "tag_description" {
  default = "Azure Kubernetes Services (AKS) Cluster"
}

variable "tag_environment" {
  default = "unknown"
}

variable "tag_billing" {}

resource "azurerm_route_table" "route-table" {
  count               = "${length(var.route_tables)}"
  resource_group_name = "${var.resource_groups[element(var.route_tables[count.index], 1)]}"
  name                = "${element(var.route_tables[count.index], 0)}"
  location            = "${var.location}"

  tags {
    description = "${var.tag_description}"
    environment = "${var.tag_environment}"
    billing     = "${var.tag_billing}"
  }
}

output "resource_group_name_list" {
  value = "${var.resource_groups}"
}

output "route_table_id_list" {
  value = ["${azurerm_route_table.route-table.*.id}"]
}

output "route_table_subnet_list" {
  value = ["${azurerm_route_table.route-table.*.subnets}"]
}
