#ip of public instance
output "public_ip" {
  value = aws_instance.ec2_public.public_ip
}

# Output for EC2 instance ID
output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2_public.id
}
output "ec2_public_id" {
  value = var.ec2_public_id
}

output "availability_zone" {
  value = var.availability_zone
}
#output "instance_id" {
#  value = var.instance_id
#}
output "root_block_device" {
  value = aws_instance.ec2_public.root_block_device
}
output "ec2_public" {
  value = aws_instance.ec2_public
}
output "environment" {
  value = var.environment  
}
output "key_name" {
  value = var.key_name  
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
