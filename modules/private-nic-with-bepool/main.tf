resource "azurerm_network_interface" "nic-with-bepool" {
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource-group-name}"

  ip_configuration {
    name                                    = "${var.name}-ip-config"
    subnet_id                               = "${var.subnet-id}"
    private_ip_address_allocation           = "${var.allocation}"
    load_balancer_backend_address_pools_ids = ["${var.bepool-ids}"]
  }

  tags = "${var.tags}"
}
