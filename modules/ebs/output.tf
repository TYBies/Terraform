# Output for root EBS volume size
# Output for root EBS volume size
output "ec2_root_ebs_size" {
  description = "The size (in GB) of the root EBS volume"
  value       = var.root_block_device[0].volume_size  
}

# Output for root EBS volume encryption status
output "ec2_root_ebs_encrypted" {
  description = "Whether the root EBS volume is encrypted"
  value       = var.root_block_device[0].encrypted  
}

# Output for root EBS volume ID
output "ec2_root_ebs_volume_id" {
  description = "The ID of the root EBS volume"
  value       = var.root_block_device[0].volume_id  
}

# Output the instance ID
output "ec2_instance_id" {
  value = var.instance_id  
}

