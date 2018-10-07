variable "name" {}
variable "resource-group-name" {}
variable "upgrade-policy-mode" {}
variable "tier" {}
variable "number-of-instances" {}
variable "network-profile-name" {}
variable "subnet-id" {}

variable "load-balancer-backend-address-pool-id" {}

variable "load-balancer-inbound-nat-rules-ids" {
  type = "list"
}

variable "vm-size" {}
variable "delete-os-disk-on-termination" {}
variable "delete-data-disks-on-termination" {}
variable "primary-blob-endpoint" {}
variable "supported-image" {}
variable "os-disk-caching" {}
variable "os-disk-create-option" {}
variable "os-disk-type" {}
variable "data-disk-create-option" {}
variable "data-disk-size-gb" {}
variable "data-disk-lun" {}
variable "data-disk-caching" {}
variable "adminuser" {}
variable "adminpass" {}
variable "custom-data" {}
variable "disable-password-auth" {}
variable "location" {}
variable "tags" {
    type = "map"
    default = {
        tag_description = "!!Not Provided!!"
        tag_billing = "!!Not Provided!!"
        tag_environment = "!!Not Provided!!"
    }
}
