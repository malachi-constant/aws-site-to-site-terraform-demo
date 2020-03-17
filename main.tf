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
