resource "azurerm_virtual_machine_scale_set" "scaling-linux-vm" {
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource-group-name}"
  upgrade_policy_mode = "${var.upgrade-policy-mode}"

  sku {
    name     = "${var.vm-size}"
    tier     = "${var.tier}"
    capacity = "${var.number-of-instances}"
  }

  network_profile {
    name    = "${var.network-profile-name}"
    primary = true

    ip_configuration {
      name                                   = "${var.network-profile-name}IPConfiguration"
      subnet_id                              = "${var.subnet-id}"
      load_balancer_backend_address_pool_ids = ["${var.load-balancer-backend-address-pool-id}"]
      load_balancer_inbound_nat_rules_ids    = ["${var.load-balancer-inbound-nat-rules-ids}"]
    }
  }

  boot_diagnostics = {
    storage_uri = "${var.primary-blob-endpoint}"
    enabled     = true
  }

  storage_profile_image_reference {
    id = "${var.supported-image}"
  }

  storage_profile_os_disk {
    managed_disk_type = "${var.os-disk-type}"
    caching           = "${var.os-disk-caching}"
    create_option     = "${var.os-disk-create-option}"
  }

  storage_profile_data_disk {
    create_option = "${var.data-disk-create-option}"
    caching       = "${var.data-disk-caching}"
    disk_size_gb  = "${var.data-disk-size-gb}"
    lun           = "${var.data-disk-lun}"
  }

  os_profile {
    computer_name_prefix = "${var.name}"
    admin_username       = "${var.adminuser}"
    admin_password       = "${var.adminpass}"
    custom_data          = "${var.custom-data}"
  }

  os_profile_linux_config {
    disable_password_authentication = "${var.disable-password-auth}"
  }

  tags = "${var.tags}"
}
