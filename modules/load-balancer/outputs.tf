output "lb_id" {
  value = ["${concat(azurerm_lb.load-balancer-pip.*.id, azurerm_lb.load-balancer-subnet.*.id)}"]
}

output "lb_probe_id" {
  value = ["${azurerm_lb_probe.lb_probe.*.id}"]
}

output "bepools_id" {
  value = ["${azurerm_lb_backend_address_pool.load-balancer-bepool.*.id}"]
}
