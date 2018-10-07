variable "name" {}
variable "location" {}
variable "resource-group-name" {}
variable "dns-prefix" {}
variable "linux-admin-username" {}
variable "linux-admin-ssh-public-key" {}
variable "agent-pool-name" {}
variable "agent-pool-count" {}
variable "agent-pool-vm-size" { default = "Standard_B1s"}
variable "agent-pool-os-disk-size" { default=30 }
variable "sp-client-id" {}
variable "sp-client-secret" {}
variable "vnet-subnet-id" {}
variable "tags" {
    type = "map"
    default = {
        tag_description = "!!Not Provided!!"
        tag_billing = "!!Not Provided!!"
        tag_environment = "!!Not Provided!!"
    }
}
