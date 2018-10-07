# Resource Groups
# ---------------
# A list of resource groups that terraform will create, typically
# there is only one resource group per application.
#
# EG: ["resource-group-1", "resource-group-2"]
#
variable "resource_groups" {
  type = "list"
}

# Subnets
# -------
# Each application will have at least one subnet (i.e. tier) and most
# will have multiple, e.g. web, app, and database tier. The subnet
# CIDR blocks *MUST* be allocated from the core cloud team
#
variable "subnets" {
  type = "list"
}

# Public IP Id list
# -----------------
# The list of public IP address ids (Note, this is the output of publicip)
#
variable "public_ips" {
  type = "list"
}

# Load Balancers with Public IPs
# ------------------------------
# Load balancers (equiv. to a virtual IP) are Layer 4 load balancers which provide a
# public facing IP address. A PIP must be defined above before defining the Public LB.
#
# Attributes
#   0 lb name,
#   1 rg pointer, 
#   2 public ip pointer, 
#   3 sku - Generally always Standard for Public IPs
#
# EG: [["lb-web-tier", 0, 0, "Standard"]]
#
variable "load_balancers_pip" {
  type = "list"
}

# Load Balancers on subnets
# -------------------------
# Load balancers (equiv. to a virtual IP) are Layer 4 load balancers which provide a
# private facing IP address. The IP address should be static and *currently* it's
# manually defined in the list below - in future we will move this to be dynamically
# defined.
#
# *IMPORTANT NOTE* when using a standard SKU load balancer with a private IP there is
#                  no access outbound to the Internet - see the link below. The
#                  workaround is to use a Basic SKU or do option 1 or 2 of the link;
#                  option 3 does *NOT* work with Standard SKU
#
#                  https://docs.microsoft.com/en-gb/azure/load-balancer/load-balancer-outbound-connections
#
# *IMPORTANT NOTE* when referencing load balancers in the tf script, the results of the
#                  lb public ip and lb private ip are concatenated to provide a
#                  complete list, i.e.: 
#
#                  concat(azurerm_lb.load-balancer-pip.*.id, azurerm_lb.load-balancer-subnet.*.id)
#
#                  When looking at the list of lbs to reference in other variables, you
#                  should start at length of the concatenated list (e.g. if 1 lb pip, then 
#                  first row would be at 1 NOT 0)
#
# Attributes
#   0 lb name,
#   1 rg pointer, 
#   2 subnet pointer, 
#   3 sku, 
#   4 static ip, 
#   5 public ip pointer
#
# EG: [["lb-app-tier", 0, 1, "Basic", "10.4.2.50", 0], ["lb-db-tier", 0, 2, "Basic", "10.4.2.80", 0]]
#
variable "load_balancers_subnet" {
  type = "list"
}

# Backend Pools
# -------------
# Applies to both Public and Private load balancers. The backend pool homes the list
# of resources that will be load balanced. Note, they aren't defined here, this is
# simply the pools
#
# Attributes
#   0 lb be pool name,
#   1 rg pointer, 
#   2 lb pointer (from above - Note the two lists are joined!)
#
# EG: bepools = [["bep-web-servers", 0, 0],["bep-app-servers", 0, 1]]
#
variable "bepools" {
  type = "list"
}

# Probes
# ------
# Load balancers require health probes to ensure that the resources being load balanced
# are reachable; if they aren't reachable, then the load balancer stops directing traffic
# to the resource. Applies to both Public and Private load balancers.
#
# Attributes
#   0 probe name,
#   1 rg pointer,
#   2 lb pointer, 
#   3 protocol, for example tcp
#   4 port, - for example 22
#   5 interval, 
#   6 no. probes, 
#   7 http path (only for http) - for example /mysite
#
# EG probes = [["pr-http-WebTier-8080", 0, 0, "http", 8080, 5, 4, "/"], ["pr-http-AppTier-5000", 0, 1, "http", 5000, 5, 4, "/v1/modes"],]
#
variable "probes" {
  type = "list"
}

# Load Balancer Rules
# -------------------
# Load balancers define the rules to translate port level calls from the originator to
# the load balanced resources. Applies to both Public and Private load balancers.
#
# Attributes
#   0 rule name, 
#   1 rg pointer, 
#   2 lb pointer, 
#   3 probe pointer, 
#   4 protocol, 
#   5 fe port, 
#   6 be port, 
#   7 floating IP, 
#   8 idle time (min.)
#
# EG: lb_rules = [["lbr-web-server", 0, 0, 0, "tcp", 80, 8080, false, 5],["lbr-app-server", 0, 1, 1, "tcp", 5000, 5000, false, 5],]
#
variable "lb_rules" {
  type = "list"
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
