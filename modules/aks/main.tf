# Create resource groups
resource "azurerm_kubernetes_cluster" "k8cluster" {  
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource-group-name}"
  dns_prefix          = "${var.dns-prefix}"

  linux_profile {
    admin_username = "${var.linux-admin-username}"

    ssh_key {
      key_data = "${var.linux-admin-ssh-public-key}"
    }
  }

  agent_pool_profile {
    name            = "${var.agent-pool-name}"
    count           = "${var.agent-pool-count}"
    vm_size         = "${var.agent-pool-vm-size}"
    os_type         = "Linux"
    os_disk_size_gb = "${var.agent-pool-os-disk-size}"
    vnet_subnet_id  = "${var.vnet-subnet-id}"
  }

  service_principal {
    client_id     = "${var.sp-client-id}"
    client_secret = "${var.sp-client-secret}"
  }

  tags = "${var.tags}"
}

