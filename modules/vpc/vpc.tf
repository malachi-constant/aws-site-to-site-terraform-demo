// Build the base VPC
resource "aws_vpc" "vpc" {
  cidr_block           = "10.${var.octet}.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }

}

// Build an internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "igw-${var.vpc_name}"
  }
}

// Build a NAT gateway
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet_1.id
}

// Build EIP for NAT gateway
resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_vpc_peering_connection" "this" {
  for_each    = var.peered_vpc_ids
  peer_vpc_id = each.value
  vpc_id      = aws_vpc.vpc.id
  auto_accept = true

}

data "aws_vpc" "this" {
  for_each = var.peered_vpc_ids
  id       = each.value

}

# DHCP Options Set Assocation
resource "aws_vpc_dhcp_options_association" "this" {
  count           = var.dhcp_options_set_id == "" ? 0 : 1
  vpc_id          = aws_vpc.vpc.id
  dhcp_options_id = var.dhcp_options_set_id
}
