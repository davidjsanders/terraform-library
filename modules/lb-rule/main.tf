resource "azurerm_lb_rule" "lb_rule" {
  name                           = "${var.name}"
  resource_group_name            = "${var.resource-group-name}"
  loadbalancer_id                = "${var.load-balancer-id}"
  probe_id                       = "${var.probe-id}"
  backend_address_pool_id        = "${var.bepool-id}"
  protocol                       = "${var.protocol}"
  frontend_port                  = "${var.frontend-port}"
  backend_port                   = "${var.backend-port}"
  frontend_ip_configuration_name = "${var.frontend-config-name}"
  enable_floating_ip             = "${var.enable-floating-ip}"
  idle_timeout_in_minutes        = "${var.idle-timeout-in-minutes}"
  load_distribution              = "${var.load-distribution}"
}
