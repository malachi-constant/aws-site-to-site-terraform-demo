
###########################
# Step 6: Create VGW
###########################

resource "aws_vpn_gateway" "this" {
  vpc_id = module.vpc-b.vpc

  tags = {
    Name = join("-", [var.prefix, "vgw"])
  }
}
