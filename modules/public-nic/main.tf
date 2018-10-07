resource "azurerm_network_interface" "nic" {
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource-group-name}"

  ip_configuration {
    name                          = "${var.name}-ip-config"
    subnet_id                     = "${var.subnet-id}"
    private_ip_address_allocation = "${var.allocation}"
    private_ip_address            = "${var.private-ip-address}"
    public_ip_address_id          = "${var.public-ip-id}"
  }

  tags = "${var.tags}"
}
