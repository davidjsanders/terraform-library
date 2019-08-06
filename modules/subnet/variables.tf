variable "name" {}
variable "address-prefix" {}
variable "vnet-target-rg-name" {}
variable "vnet-target-name" {}

variable "service-endpoints" {
  type    = "list"
  default = []
}
