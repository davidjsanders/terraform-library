variable "name" {}
variable "sku" {}

variable "frontend-name" {
  default = "frontendIpConfiguration"
}

variable "private-ip" {}
variable "subnet-id" {}

variable "resource-group-name" {}
variable "location" {}
variable "tags" {
    type = "map"
    default = {
        tag_description = "!!Not Provided!!"
        tag_billing = "!!Not Provided!!"
        tag_environment = "!!Not Provided!!"
    }
}
