output "public_ips" {
  value = aws_instance.ec2_public[*].public_ip
}

# Output all instance IDs as a list
output "ec2_instance_ids" {
  description = "The IDs of the EC2 instances"
  value       = aws_instance.ec2_public[*].id
}

output "ec2_public_id" {
  value = var.ec2_public_id
}

output "availability_zone" {
  description = "List of availability zones of the instances"
  value       = aws_instance.ec2_public[*].availability_zone
}

output "ec2_public" {
  value = aws_instance.ec2_public[*]
}

output "environment" {
  value = var.environment  
}

output "instance_type" {
  value = var.instance_type  
}

output "monitoring" {
  value = var.monitoring  
}

output "subnet_ids" {
  value = var.subnet_ids  
}

output "db_type_instance" {
  value = var.db_type_instance    
}

output "vpc_id" {
  value = var.vpc_id   
}

output "sg_pub_id" {
  value = var.sg_pub_id  
}
