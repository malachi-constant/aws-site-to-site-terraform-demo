# aws-site-to-site-terraform-demo
WIP: Demonstrate Dynamic Site-to-site VPNs on AWS with Terraform &amp; vyos
## Prerequisites
- Terraform 12
- AWS Account Access

## Step 1: Set Your Variables
`echo "profile    = 'SOME_PROFILE_NAME'\nregion     = 'SOME_AWS_REGION'\nprefix     = 'SOME_PREFIX'\npublic_key = 'SOME_PUBLIC_KEY_STRING'
" > example.tfvars`

## Step 2: Initialize & Run Terraform
`terraform init && terraform apply -var-file="example.tfvars"`  
**Expected Output:** ![Step 2](/images/step2.png)

## Step 3: Create Two VPCS and an EC2 Key Pair
`cat steps/3.tf >> main.tf && terraform init && terraform apply -var-file="example.tfvars"`  
**Expected Output:** ![Step 3](/images/step3.png)

## Step 4: Create Vyos instance in VPC A
`cat steps/4.tf >> main.tf && terraform init && terraform apply -var-file="example.tfvars"`  
**Expected Output:**

## Step 5: Create Customer Gateway to represent vyos router in VPC A
`cat steps/5.tf >> main.tf && terraform init && terraform apply -var-file="example.tfvars"`  
**Expected Output:**

## Step 6: Create Virtual Private Gateway in VPC B
`cat steps/6.tf >> main.tf && terraform init && terraform apply -var-file="example.tfvars"`  
**Expected Output:**

## Step 7: Create VPN Connection
`cat steps/7.tf >> main.tf && terraform init && terraform apply -var-file="example.tfvars"`  
**Expected Output:**

## Step n: Terraform Destroy
`terraform destroy -var-file="example.tfvars"`
