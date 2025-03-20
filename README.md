# AWS WordPress Deployment with Terraform

This project deploys a highly available WordPress installation on AWS using Terraform. The infrastructure includes EC2 instances in an Auto Scaling Group and RDS for the database.

## Architecture

- VPC with public and private subnets across 2 availability zones
- EC2 instances in an Auto Scaling Group
- RDS MySQL database in private subnet
- Security Groups for EC2 and RDS
- EBS volumes for WordPress files

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 1.0 or later)
- Git

## Project Structure

terraform-exam/
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│ ├── vpc/
│ ├── ec2/
│ ├── rds/
│ └── alb/
└── scripts/
└── install_wordpress.sh


## Quick Start

1. Clone the repository
2. Initialize Terraform:
```bash
terraform init
terraform plan
terraform apply

Copy

Configuration
The following variables can be customized in variables.tf:

AWS region

VPC CIDR

Instance type

RDS instance class

Database credentials

To destroy all resources:

terraform destroy

Security Notes
Database credentials should be managed securely

SSH keys are generated for EC2 access

Security groups are configured for minimal required access

Contributing
Feel free to submit issues and enhancement requests.

License
