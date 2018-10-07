variable "name" {}
variable "location" {}
variable "cidr-block" {
  type = "list"
}
variable "resource-group-name" {}
variable "tags" {
    type = "map"
    default = {
        tag_description = "!!Not Provided!!"
        tag_billing = "!!Not Provided!!"
        tag_environment = "!!Not Provided!!"
    }
}
variable "dns-servers" {
  type    = "list"
  default = []
}
