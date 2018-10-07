resource "azurerm_availability_set" "avset" {
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource-group-name}"

  platform_fault_domain_count  = "${var.platform-fault-domain-count}"
  platform_update_domain_count = "${var.platform-update-domain-count}"
  managed                      = "${var.managed}"

  tags = "${var.tags}"
}
