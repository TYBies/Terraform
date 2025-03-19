# dynamically retrieves availability zones
data "aws_availability_zones" "available" { state = "available"}

# VPC configuration with proper CIDR blocks and AZ distribution from terraform
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"  

  name = "${var.environment}-vpc"
  cidr = var.vpc_cidr
  azs = data.aws_availability_zones.available.names

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  
  #create_database_subnet_group = true
  enable_nat_gateway = true # Enable NAT gateway for private subnets
  single_nat_gateway = true # Only one NAT gateway for all private subnets
  enable_dns_hostnames = true # Enable DNS hostnames in the VPC
  enable_dns_support = true #  Enable DNS support in the VPC 
  map_public_ip_on_launch = true
  tags = {
    Terraform = "true"
    Environment = "${var.environment}"
  }
}
