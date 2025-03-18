output "endpoint" {
  value       = aws_db_instance.wordpress_db.endpoint
  description = "The RDS endpoint"
}

output "username" {
  value       = aws_db_instance.wordpress_db.username
  description = "The RDS master username"
}
output "password" {
  value       = aws_db_instance.wordpress_db.password
  description = "The RDS master password"
  sensitive   = true
}

output "db_name" {
  value       = aws_db_instance.wordpress_db.db_name
  description = "The database name"
}
output "sg_rds_id" {
  value = aws_security_group.rds.id
  description = "Security Group ID for RDS"  
}
output "environment" {
  value = var.environment
  description = "Environment for the resources"
  
}