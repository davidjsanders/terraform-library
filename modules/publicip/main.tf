resource "azurerm_public_ip" "pip" {
  name                 = "${var.name}"
  location             = "${var.location}"
  resource_group_name  = "${var.resource-group-name}"
  allocation_method    = "${var.allocation-method}"
  domain_name_label    = "${var.domain-name-label}"
  sku                  = "${var.sku}"

  tags = "${var.tags}"
}
