resource "azurerm_lb_probe" "lb_probe" {
  name                = "${var.name}"
  resource_group_name = "${var.resource-group-name}"
  loadbalancer_id     = "${var.load-balancer-id}"
  protocol            = "${var.protocol}"
  port                = "${var.port}"
  interval_in_seconds = "${var.interval-in-seconds}"
  number_of_probes    = "${var.number-of-probes}"
  request_path        = "${var.http-probe-path}"
}
