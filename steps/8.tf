
###############################
# Step 8: Add Routes to VGW
###############################

resource "aws_route" "public" {
  route_table_id            = module.vpc-b.public_route_table
  destination_cidr_block    = module.vpc-a.cidr_block
  gateway_id                = aws_vpn_gateway.this.id
}

resource "aws_route" "private" {
  route_table_id            = module.vpc-b.private_route_table
  destination_cidr_block    = module.vpc-a.cidr_block
  gateway_id                = aws_vpn_gateway.this.id
}
