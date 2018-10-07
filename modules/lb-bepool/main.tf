resource "azurerm_lb_backend_address_pool" "load-balancer-bepool" {
  name                = "${var.name}"
  resource_group_name = "${var.resource-group-name}"
  loadbalancer_id     = "${var.load-balancer-id}"
}
