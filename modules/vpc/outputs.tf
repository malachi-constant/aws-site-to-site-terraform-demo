output "vpc" {
  value = aws_vpc.vpc.id
}

output "sg_default" {
  value = aws_default_security_group.default.id
}

output "sg_management" {
  value = aws_security_group.mgmt.id
}

output "public_subnet_1" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2" {
  value = aws_subnet.public_subnet_2.id
}

output "public_subnet_3" {
  value = aws_subnet.public_subnet_3.id
}

output "management_subnet" {
  value = aws_subnet.public_subnet_4.id
}

output "public_route_table" {
  value = aws_route_table.public_subnets.id
}

output "private_route_table" {
  value = aws_route_table.private_subnets.id
}

output "az_1" {
  value = aws_subnet.public_subnet_1.availability_zone
}

output "az_2" {
  value = aws_subnet.public_subnet_2.availability_zone
}

output "az_3" {
  value = aws_subnet.public_subnet_3.availability_zone
}

output "az_4" {
  value = aws_subnet.public_subnet_4.availability_zone
}

output "private_subnet_1" {
  value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2" {
  value = aws_subnet.private_subnet_2.id
}

output "private_subnet_3" {
  value = aws_subnet.private_subnet_3.id
}

output "cidr_block" {
  value = aws_vpc.vpc.cidr_block
}

output "nat_gateway_ip" {
  value = aws_eip.nat.public_ip
}
