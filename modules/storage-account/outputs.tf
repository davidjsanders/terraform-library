output "name" {
  value = "${azurerm_storage_account.storage-account.name}"
}

output "primary_blob_endpoint" {
  value = "${azurerm_storage_account.storage-account.primary_blob_endpoint}"
}
