variable "name" {}
variable "sku" {}

variable "frontend-name-1" {
  default = "frontendIpConfiguration1"
}

variable "frontend-name-2" {
  default = "frontendIpConfiguration2"
}

variable "private-ip-1" {}
variable "private-ip-2" {}

variable "subnet-id-1" {}
variable "subnet-id-2" {}

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
