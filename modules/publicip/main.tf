resource "azurerm_public_ip" "pip" {
  name                         = "${var.name}"
  location                     = "${var.location}"
  resource_group_name          = "${var.resource-group-name}"
  public_ip_address_allocation = "${var.public-ip-address-allocation}"
  domain_name_label            = "${var.domain-name-label}"
  sku                          = "${var.sku}"

  tags = "${var.tags}"
}
