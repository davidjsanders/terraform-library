variable "name" {}
variable "resource-group-name" {}
variable "location" {}
variable "subnet-id" {}
variable "allocation" {}

variable "bepool-ids" {}

variable "tags" {
    type = "map"
    default = {
        tag_description = "!!Not Provided!!"
        tag_billing = "!!Not Provided!!"
        tag_environment = "!!Not Provided!!"
    }
}
