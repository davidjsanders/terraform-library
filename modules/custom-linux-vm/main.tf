resource "azurerm_virtual_machine" "custom-linux-vm" {
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource-group-name}"

  network_interface_ids            = ["${var.nic-id}"]
  vm_size                          = "${var.vm-size}"
  delete_os_disk_on_termination    = "${var.delete-os-disk-on-termination}"
  delete_data_disks_on_termination = "${var.delete-data-disks-on-termination}"
  availability_set_id              = "${var.availability-set-id}"

  boot_diagnostics = {
    storage_uri = "${var.primary-blob-endpoint}"
    enabled     = true
  }

  storage_image_reference {
    id = "${var.supported-image}"
  }

  storage_os_disk {
    name              = "${var.os-disk-name}"
    caching           = "${var.os-disk-caching}"
    create_option     = "${var.os-disk-create-option}"
    managed_disk_type = "${var.os-disk-type}"
  }

  storage_data_disk {
    name            = "${var.data-disk-name}"
    managed_disk_id = "${var.data-disk-id}"
    create_option   = "${var.data-disk-create-option}"
    disk_size_gb    = "${var.data-disk-size-gb}"
    lun             = "${var.data-disk-lun}"
  }

  os_profile {
    computer_name  = "${var.name}"
    admin_username = "${var.adminuser}"
    admin_password = "${var.adminpass}"
    custom_data    = "${var.custom-data}"
  }

  os_profile_linux_config {
    disable_password_authentication = "${var.disable-password-auth}"
  }

  tags = "${var.tags}"
}
