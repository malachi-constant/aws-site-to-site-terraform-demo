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
