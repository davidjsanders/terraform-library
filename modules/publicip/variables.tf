variable "resource-group-name" {}
variable "name" {}
variable "public-ip-address-allocation" {}
variable "domain-name-label" {}
variable "sku" {}
variable "location" {}
variable "tags" {
    type = "map"
    default = {
        tag_description = "!!Not Provided!!"
        tag_billing = "!!Not Provided!!"
        tag_environment = "!!Not Provided!!"
    }
}
