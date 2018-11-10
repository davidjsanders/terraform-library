variable "name" {}
variable "resource-group-name" {}
variable "nic-id" {}
variable "vm-size" {}
variable "delete-os-disk-on-termination" {}
variable "delete-data-disks-on-termination" {}
variable "availability-set-id" {}
variable "primary-blob-endpoint" {}
variable "supported-image" {}
variable "os-disk-name" {}
variable "os-disk-caching" {}
variable "os-disk-create-option" {}
variable "os-disk-type" {}
variable "os-disk-size-gb" { default = "32"}
variable "adminuser" {}
variable "adminpass" {}
variable "ssh-key-path" {
  default = ""
}
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
