
###########################
# Step 4: Vyos Router vpc-a
###########################

# Create Router for on-prem demo
module "vyos-router" {
  source                 = "./modules/vyos-instance"
  ami_id                 = var.vyos_ami_id
  prefix                 = var.prefix
  instance_type          = "m3.medium"
  vpc_id                 = module.vpc-a.vpc
  subnet_id              = module.vpc-a.public_subnet_1
  ssh_ingress_cidr_block = join("/", [var.my_public_ip, "32"])
  vpc_ingress_cidr_block = module.vpc-b.cidr_block
  key_pair               = aws_key_pair.this.key_name
}
