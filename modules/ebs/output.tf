# modules/ebs/outputs.tf
output "ebs_volume_ids" {
  description = "List of created EBS volume IDs"
  value       = aws_ebs_volume.terraform_exam_ebs[*].id
}

output "ebs_attachment_ids" {
  description = "List of EBS attachment IDs"
  value       = aws_volume_attachment.terraform_exam_ebs_att[*].id
}

output "ebs_volume_sizes" {
  description = "List of EBS volume sizes"
  value       = aws_ebs_volume.terraform_exam_ebs[*].size
}

# If you need to output information about the root device, get it from the EC2 instance
output "ec2_instance_ids" {
  description = "List of EC2 instance IDs"
  value       = var.instance_ids
}