
###########################
# Step 4: Vyos Router vpc-a
###########################

# Create Router for on-prem demo
module "vyos-router" {
  source                 = "./modules/vyos-instance"
  ami_id                 = var.vyos_ami_id
  prefix                 = var.prefix
  instance_type          = "t3.small"
  vpc_id                 = module.vpc-a.vpc
  subnet_id              = module.vpc-a.public_subnet_1
  ssh_ingress_cidr_block = join("/", [var.my_public_ip, "32"])
  key_pair               = aws_key_pair.this.public_key
}
