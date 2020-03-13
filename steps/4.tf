
###########################
# Step 2: Vyos Router vpc-a
###########################

# Create Router for on-prem demo
module "vyos-router" {
  source = "./modules/vyos-instance"
}
