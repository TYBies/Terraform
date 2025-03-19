provider "aws" {
  region = module.networking.region  # Use the region from the networking module
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Networking Module
module "networking" {
  source    = "./modules/networking"
  region = var.region
  environment = var.environment  
  vpc_cidr  = var.vpc_cidr 
}

# Security Module
module "security" {
  source    = "./modules/security"
  vpc_id = module.networking.vpc_id  # Pass VPC from the networking module
  environment = var.environment
  depends_on = [module.networking] 
}

# EC2 Module
module "ec2" {
  source     = "./modules/ec2"
  environment = var.environment
  vpc_security_group_ids = [module.security.sg_pub_id]  # Pass public SG ID from the security module
  vpc_id    = module.networking.vpc_id  # Pass VPC from the networking module
  sg_pub_id  = module.security.sg_pub_id # Pass public SG ID from the security module
  subnet_ids = module.networking.public_subnets  # Pass public subnets from the networking module
  instance_id = var.instance_type
  key_name = var.key_name
  depends_on = [module.networking, module.security]
}

# RDS Module
module "rds" {
  source      = "./modules/rds"  
  environment = module.ec2.environment  # Pass environment from EC2 module
  sg_rds_id   = module.security.sg_rds_id # Pass RDS SG ID from the security module
  subnet_ids  = module.networking.private_subnets  # 
  vpc_security_group_ids = [module.security.sg_rds_id] # Pass RDS SG ID from the security module
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  depends_on = [ module.networking, module.security ]
}

# EBS Module
module "ebs" {
  source             = "./modules/ebs"
  availability_zone  = module.ec2.availability_zone # Use AZ from the EC2 module     # Use EC2 instance ID from the EC2 module
  ebs_size           = var.ebs_size    # Use root block device from the EC2 module
  instance_ids       = module.ec2.ec2_instance_ids
  environment        = var.environment  # Use environment from the EC2 module
  depends_on = [module.ec2]
}