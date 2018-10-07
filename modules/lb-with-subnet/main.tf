resource "azurerm_lb" "load-balancer-with-subnet" {
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource-group-name}"
  sku                 = "${var.sku}"

  frontend_ip_configuration {
    name                          = "${var.frontend-name}"
    private_ip_address            = "${var.private-ip}"
    private_ip_address_allocation = "Static"
    subnet_id                     = "${var.subnet-id}"
  }

  tags = "${var.tags}"
}
