###############
# Locals
###############

# Get AWS account ID
data "aws_caller_identity" "current" {}

# Get current region
data "aws_region" "current" {}

# AZs
data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  region     = data.aws_region.current.name
  account_id = data.aws_caller_identity.current.account_id
}

###############
# Core
###############

# EC2 Key Pair
resource "aws_key_pair" "this" {
  key_name_prefix = var.prefix
  public_key      = var.public_key
}

###############
# Step 1: VPCs
###############

module "vpc-a" {
  source   = "./modules/vpc"
  vpc_name = join("-",[var.prefix,"a"])
  octet    = "88"
  region   = local.region

}
module "vpc-a" {
  source   = "./modules/vpc"
  vpc_name = join("-",[var.prefix,"b"])
  octet    = "98"
  region   = local.region

}


###########################
# Step 2: Vyos Router vpc-a
###########################

# Create Router for on-prem demo
# module "vyos-router" {
#   source = "./modules/vyos-instance"
# }

###########################
# Step 3: Create CGW
###########################

resource "aws_customer_gateway" "this" {
  bgp_asn    = 65000
  ip_address = module.vyos-router.public_ip
  type       = "ipsec.1"

  tags = {
    Name = join("-",[var.prefix,"cgw"])
  }
}
