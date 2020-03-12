/* ---------- Build private subnets ---------- */

// Build private subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.${var.octet}.0.0/20"
  availability_zone = "${var.region}a"

  tags = {
    Name = "${var.vpc_name}-private-1"
  }
}

resource "aws_route_table_association" "private_subnet_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_subnets.id
}

// Build private subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.${var.octet}.16.0/20"
  availability_zone = "${var.region}c"

  tags = {
    Name = "${var.vpc_name}-private-2"
  }
}

resource "aws_route_table_association" "private_subnet_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_subnets.id
}

// Build private subnet 3
resource "aws_subnet" "private_subnet_3" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.${var.octet}.32.0/20"
  availability_zone = "${var.region}d"

  tags = {
    Name = "${var.vpc_name}-private-3"
  }
}

resource "aws_route_table_association" "private_subnet_3" {
  subnet_id      = aws_subnet.private_subnet_3.id
  route_table_id = aws_route_table.private_subnets.id
}
