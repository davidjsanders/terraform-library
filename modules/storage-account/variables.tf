variable "name" {}
variable "resource-group-name" {}
variable "account-tier" {}
variable "account-replication-type" {}
variable "enable-blob-encryption" {}
variable "enable-https-traffic-only" {}
variable "location" {}
variable "tags" {
    type = "map"
    default = {
        tag_description = "!!Not Provided!!"
        tag_billing = "!!Not Provided!!"
        tag_environment = "!!Not Provided!!"
    }
}
