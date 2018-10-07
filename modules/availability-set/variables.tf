variable "resource-group-name" {}
variable "name" {}
variable "location" {}
variable platform-fault-domain-count {}
variable platform-update-domain-count {}
variable managed {}
variable "tags" {
    type = "map"
    default = {
        tag_description = "!!Not Provided!!"
        tag_billing = "!!Not Provided!!"
        tag_environment = "!!Not Provided!!"
    }
}
