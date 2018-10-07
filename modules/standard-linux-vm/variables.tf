variable "name" {}
variable "resource-group-name" {}
variable "nic-id" {}
variable "vm-size" {}
variable "delete-os-disk-on-termination" {}
variable "delete-data-disks-on-termination" {}
variable "availability-set-id" {}
variable "primary-blob-endpoint" {}
variable "image-publisher" {}
variable "image-offer" {}
variable "image-sku" {}
variable "image-version" {}
variable "os-disk-name" {}
variable "os-disk-caching" {}
variable "os-disk-create-option" {}
variable "os-disk-type" {}
variable "data-disk-name" {}
variable "data-disk-id" {}
variable "data-disk-create-option" {}
variable "data-disk-size-gb" {}
variable "data-disk-lun" {}

variable "adminuser" {
  default = "azadmin"
}

variable "adminpass" {
  default = "Password1234!"
}

variable "custom-data" {}
variable "disable-password-auth" {}

variable "ssh-key-path" {
  default = ""
}

variable "location" {}
variable "tags" {
    type = "map"
    default = {
        tag_description = "!!Not Provided!!"
        tag_billing = "!!Not Provided!!"
        tag_environment = "!!Not Provided!!"
    }
}
