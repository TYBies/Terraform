output "sg_rds_id" {
  value       = aws_security_group.rds.id
  description = "Security Group ID for RDS"
}
output "sg_pub_id" {
  value       = aws_security_group.wordpress_public.id
  description = "Security Group ID for Public"  
}