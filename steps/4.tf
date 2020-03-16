
###########################
# Step 4: Vyos Router vpc-a
###########################

# Create Router for on-prem demo
module "vyos-router" {
  source                 = "./modules/vyos-instance"
  ami_id                 = "ami-0aca6fa37cf13a480"
  instance_type          = "t3.small"
  vpc_id                 = module.vpc.vpc
  subnet_id              = module.vpc.public_subnet_1
  ssh_ingress_cidr_block = join("/", [var.my_public_ip, "32"])
}
