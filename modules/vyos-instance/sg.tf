resource "aws_security_group" "this" {
  name        = join("-", [var.prefix, "vyos"])
  description = "Allow ssh traffic from certain IP range to vyos_instance on port 22"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "-1"
    cidr_blocks = [var.ssh_ingress_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
