resource "azurerm_storage_container" "storage-container" {
  name                  = "${var.name}"
  resource_group_name   = "${var.resource-group-name}"
  storage_account_name  = "${var.storage-account-name}"
  container_access_type = "${var.container-access-type}"
}
