resource "azurerm_lb_nat_pool" "lb_nat_pool" {
  name                           = "${var.name}"
  resource_group_name            = "${var.resource-group-name}"
  loadbalancer_id                = "${var.load-balancer-id}"
  protocol                       = "${var.protocol}"
  frontend_port_start            = "${var.frontend-port-start}"
  frontend_port_end              = "${var.frontend-port-end}"
  backend_port                   = "${var.backend-port}"
  frontend_ip_configuration_name = "${var.frontend-config-name}"
}
