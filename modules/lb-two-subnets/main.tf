resource "azurerm_lb" "load-balancer-two-subnets" {
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource-group-name}"
  sku                 = "${var.sku}"

  frontend_ip_configuration {
    name                          = "${var.frontend-name-1}"
    private_ip_address            = "${var.private-ip-1}"
    private_ip_address_allocation = "Static"
    subnet_id                     = "${var.subnet-id-1}"
  }

  frontend_ip_configuration {
    name                          = "${var.frontend-name-2}"
    private_ip_address            = "${var.private-ip-2}"
    private_ip_address_allocation = "Static"
    subnet_id                     = "${var.subnet-id-2}"
  }

  tags = "${var.tags}"
}
