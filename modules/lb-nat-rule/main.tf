resource "azurerm_lb_nat_rule" "lb_nat_rule" {
  name                           = "${var.name}"
  resource_group_name            = "${var.resource-group-name}"
  loadbalancer_id                = "${var.load-balancer-id}"
  protocol                       = "${var.protocol}"
  frontend_port                  = "${var.frontend-port}"
  backend_port                   = "${var.backend-port}"
  frontend_ip_configuration_name = "${var.frontend-config-name}"
}
