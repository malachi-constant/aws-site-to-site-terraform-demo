# aws-site-to-site-terraform-demo
Demonstrate Dynamic Site-to-site VPNs on AWS with Terraform &amp; vyos
## Prerequisites
- Terraform 12
- AWS Account Access

## Step 1: Set Your Variables
`echo 'profile    = "SOME_PROFILE_NAME"
region     = "SOME_AWS_REGION"
prefix     = "SOME_PREFIX"
public_key = "SOME_PUBLIC_KEY_STRING"
' > example.tfvars`

## Step 2: Initialize & Run Terraform
`terraform init`
`terraform apply -var-file="example.tfvars"`
