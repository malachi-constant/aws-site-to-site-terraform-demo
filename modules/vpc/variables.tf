variable "vpc_name" {}
variable "octet" {}
variable "region" {}
variable "peered_vpc_ids" {
  default = {}
  type    = map
}
variable "dhcp_options_set_id" {
  default = ""
}
