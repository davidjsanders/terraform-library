variable "name" {}
variable "resource-group-name" {}
variable "storage-account-type" {}
variable "create-option" {}
variable "disk-size-gb" {}
variable "location" {}
variable "tags" {
    type = "map"
    default = {
        tag_description = "!!Not Provided!!"
        tag_billing = "!!Not Provided!!"
        tag_environment = "!!Not Provided!!"
    }
}
