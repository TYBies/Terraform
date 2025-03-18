provider "aws" {
  region = module.networking.region  # Use the region from the networking module
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Networking Module
module "networking" {
  source    = "./modules/networking"
 # namespace = var.namespace
}

# Security Module
module "security" {
  source    = "./modules/security"
  #namespace = var.namespace
}

# EC2 Module
module "ec2" {
  source     = "./modules/ec2"
  namespace  = var.namespace
  vpc_id    = module.networking.vpc_id  # Pass VPC from the networking module
  sg_pub_id  = module.security.sg_pub_id # Pass public SG ID from the security module
      # Pass RDS SG ID from the security module
  subnet_ids = module.networking.public_subnet_ids  # Pass public subnets from the networking module
}

# RDS Module
module "rds" {
  source      = "./modules/rds"
   
  environment = module.ec2.environment  # Pass environment from EC2 module
  sg_rds_id   = module.security.sg_rds_id  # Pass RDS SG ID from the security module
  subnet_ids  = module.networking.private_subnet_ids  # 
  #vpc      = module.networking.vpc_id  # Pass private subnets from the networking module
}

# EBS Module
module "ebs" {
  source             = "./modules/ebs"
  availability_zone  = module.ec2.availability_zone[0]  # Use AZ from the EC2 module
  subnet_ids         = module.networking.private_subnet_ids  # Pass private subnets from the networking module
  instance_id        = module.ec2.instance_id  # Use EC2 instance ID from the EC2 module
  ebs_size           = module.ec2.ebs_size  # Use EBS size from the EC2 module
  root_block_device  = module.ec2.root_block_device  # Use root block device from the EC2 module
}
