output "vpc" {
  value =  module.vpc.vpc_id
  description = "VPC ID"
}

output "public_subnets_ids" {
  value = module.vpc.public_subnets
  description = "List of public subnet IDs"
}

output "private_subnets_ids" {
  value = module.vpc.private_subnets
  description = "List of private subnet IDs"
}
output "region" {  
  value = var.region
  description = "Region for the resources"
  
}

output "database_subnet_group" {
  value = module.vpc.database_subnet_group
  description = "Database subnet group name"
}

output "azs" {
  value = module.vpc.azs
  description = "List of availability zones"
}




