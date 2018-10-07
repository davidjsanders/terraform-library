resource "azurerm_storage_blob" "storage-blob" {
  name                   = "${var.name}"
  resource_group_name    = "${var.resource-group-name}"
  storage_account_name   = "${var.storage-account-name}"
  storage_container_name = "${var.storage-container-name}"
  type                   = "${var.storage-blob-type}"
}
