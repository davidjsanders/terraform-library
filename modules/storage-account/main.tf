resource "azurerm_storage_account" "storage-account" {
  name                      = "${var.name}"
  resource_group_name       = "${var.resource-group-name}"
  location                  = "${var.location}"
  account_tier              = "${var.account-tier}"
  account_replication_type  = "${var.account-replication-type}"
  enable_blob_encryption    = "${var.enable-blob-encryption}"
  enable_https_traffic_only = "${var.enable-https-traffic-only}"

  tags = "${var.tags}"
}
