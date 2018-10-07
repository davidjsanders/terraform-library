resource "azurerm_lb" "load-balancer-with-pip" {
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource-group-name}"
  sku                 = "${var.sku}"

  frontend_ip_configuration {
    name                 = "${var.frontend-name}"
    public_ip_address_id = "${var.public-ip-id}"
  }

  tags = "${var.tags}"
}
