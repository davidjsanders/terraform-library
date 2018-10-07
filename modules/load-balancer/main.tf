resource "azurerm_lb" "load-balancer-pip" {
  count               = "${length(var.load_balancers_pip)}"
  name                = "${element(var.load_balancers_pip[count.index], 0)}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_groups[element(var.load_balancers_pip[count.index], 1)]}"
  sku                 = "${element(var.load_balancers_pip[count.index], 3)}"

  frontend_ip_configuration {
    name                 = "frontendIPConfig"
    public_ip_address_id = "${var.public_ips[element(var.load_balancers_pip[count.index], 2)]}"
  }

  tags = "${var.tags}"
}

resource "azurerm_lb" "load-balancer-subnet" {
  count               = "${length(var.load_balancers_subnet)}"
  name                = "${element(var.load_balancers_subnet[count.index], 0)}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_groups[element(var.load_balancers_subnet[count.index], 1)]}"
  sku                 = "${element(var.load_balancers_subnet[count.index], 3)}"

  frontend_ip_configuration {
    name                          = "frontendIPConfig"
    private_ip_address            = "${element(var.load_balancers_subnet[count.index], 4)}"
    private_ip_address_allocation = "Static"
    subnet_id                     = "${var.subnets[element(var.load_balancers_subnet[count.index], 2)]}"
  }

  tags = "${var.tags}"
}

resource "azurerm_lb_backend_address_pool" "load-balancer-bepool" {
  depends_on = [
    "azurerm_lb.load-balancer-pip",
    "azurerm_lb.load-balancer-subnet",
  ]

  count               = "${length(var.bepools)}"
  name                = "${element(var.bepools[count.index], 0)}"
  resource_group_name = "${var.resource_groups[element(var.bepools[count.index], 1)]}"
  loadbalancer_id     = "${element(concat(azurerm_lb.load-balancer-pip.*.id, azurerm_lb.load-balancer-subnet.*.id), element(var.bepools[count.index], 2))}"
}

resource "azurerm_lb_probe" "lb_probe" {
  depends_on = [
    "azurerm_lb.load-balancer-pip",
    "azurerm_lb.load-balancer-subnet",
  ]

  count               = "${length(var.probes)}"
  name                = "${element(var.probes[count.index], 0)}"
  resource_group_name = "${var.resource_groups[element(var.probes[count.index], 1)]}"
  loadbalancer_id     = "${element(concat(azurerm_lb.load-balancer-pip.*.id, azurerm_lb.load-balancer-subnet.*.id), element(var.probes[count.index], 2))}"
  protocol            = "${element(var.probes[count.index], 3)}"
  port                = "${element(var.probes[count.index], 4)}"
  interval_in_seconds = "${element(var.probes[count.index], 5)}"
  number_of_probes    = "${element(var.probes[count.index], 6)}"
  request_path        = "${element(var.probes[count.index], 7)}"
}

resource "azurerm_lb_rule" "lb_rule" {
  depends_on = [
    "azurerm_lb_probe.lb_probe",
    "azurerm_lb_backend_address_pool.load-balancer-bepool",
  ]

  count                          = "${length(var.lb_rules)}"
  name                           = "${element(var.lb_rules[count.index], 0)}"
  resource_group_name            = "${var.resource_groups[element(var.lb_rules[count.index], 1)]}"
  loadbalancer_id                = "${element(concat(azurerm_lb.load-balancer-pip.*.id, azurerm_lb.load-balancer-subnet.*.id), element(var.lb_rules[count.index], 2))}"
  probe_id                       = "${element(azurerm_lb_probe.lb_probe.*.id, element(var.lb_rules[count.index], 3))}"
  backend_address_pool_id        = "${element(azurerm_lb_backend_address_pool.load-balancer-bepool.*.id, element(var.lb_rules[count.index], 3))}"
  protocol                       = "${element(var.lb_rules[count.index], 4)}"
  frontend_port                  = "${element(var.lb_rules[count.index], 5)}"
  backend_port                   = "${element(var.lb_rules[count.index], 6)}"
  frontend_ip_configuration_name = "frontendIPConfig"
  enable_floating_ip             = "${element(var.lb_rules[count.index], 7)}"
  idle_timeout_in_minutes        = "${element(var.lb_rules[count.index], 8)}"
}
