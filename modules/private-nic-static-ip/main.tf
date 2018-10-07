resource "azurerm_network_interface" "nic-static-ip" {
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource-group-name}"

  ip_configuration {
    name                          = "${var.name}-ip-config"
    subnet_id                     = "${var.subnet-id}"
    private_ip_address_allocation = "Static"
    private_ip_address            = "${var.private-ip-address}"
  }

  tags = "${var.tags}"
}
