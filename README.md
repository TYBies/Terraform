# AWS WordPress Deployment with Terraform

[![Terraform](https://img.shields.io/badge/Terraform-v1.0%2B-blueviolet)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-orange)](https://aws.amazon.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

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

```
terraform-exam/
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│   ├── vpc/
│   ├── ec2/
│   ├── rds/
│   └── alb/
└── scripts/
    └── install_wordpress.sh
```

## Quick Start

1. Clone the repository
2. Initialize Terraform:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```
3. Customize variables in `variables.tf`:
   - AWS region
   - VPC CIDR
   - Instance type
   - RDS instance class
   - Database credentials

4. To destroy all resources:
   ```bash
   terraform destroy
   ```

## Security Notes

- Database credentials should be managed securely (use environment variables or a secrets manager)
- SSH keys are generated for EC2 access
- Security groups are configured for minimal required access

## Contributing

Feel free to submit issues and enhancement requests.
Pull requests are welcome!

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
