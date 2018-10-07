variable "name" {}
variable "resource-group-name" {}
variable "load-balancer-id" {}
variable "probe-id" {}
variable "bepool-id" {}
variable "protocol" {}
variable "frontend-port" {}
variable "backend-port" {}
variable "frontend-config-name" {}
variable "idle-timeout-in-minutes" {}
variable "load-distribution" {}

variable "enable-floating-ip" {
  default = false
}
