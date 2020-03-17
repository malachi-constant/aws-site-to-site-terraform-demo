
###########################
# Step 4: Vyos Router vpc-a
###########################

# Create Router for on-prem demo
module "vyos-router" {
  source                 = "./modules/vyos-instance"
  ami_id                 = var.vyos_ami_id
  instance_type          = "t3.small"
  vpc_id                 = module.vpc.vpc
  subnet_id              = module.vpc.public_subnet_1
  ssh_ingress_cidr_block = join("/", [var.my_public_ip, "32"])
}
