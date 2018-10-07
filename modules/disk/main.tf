resource "azurerm_managed_disk" "disk" {
  name                 = "${var.name}"
  location             = "${var.location}"
  resource_group_name  = "${var.resource-group-name}"
  storage_account_type = "${var.storage-account-type}"
  create_option        = "${var.create-option}"
  disk_size_gb         = "${var.disk-size-gb}"

  tags = "${var.tags}"
}
