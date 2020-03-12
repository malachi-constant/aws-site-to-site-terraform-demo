// Build route table for public subnets
resource "aws_route_table" "public_subnets" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  dynamic "route" {
    iterator = vpc
    for_each = data.aws_vpc.this
    content {
      cidr_block                = vpc.value.cidr_block
      vpc_peering_connection_id = aws_vpc_peering_connection.this[vpc.key].id
    }
  }


  tags = {
    Name = "Public Subnets"
  }
}

// Build route table for private subnets
resource "aws_route_table" "private_subnets" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  dynamic "route" {
    iterator = vpc
    for_each = data.aws_vpc.this
    content {
      cidr_block                = vpc.value.cidr_block
      vpc_peering_connection_id = aws_vpc_peering_connection.this[vpc.key].id
    }
  }


  tags = {
    Name = "Private Subnets"
  }
}
