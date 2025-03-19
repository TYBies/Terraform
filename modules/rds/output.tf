output "endpoint" {
  value = aws_db_instance.wordpress_db[*].endpoint
}

output "db_username" {
  value = aws_db_instance.wordpress_db[*].username
}

output "password" {
  value       = aws_db_instance.wordpress_db[*].password
  description = "The RDS master password"
  sensitive   = true
}

output "db_name" {
   value = aws_db_instance.wordpress_db[*].db_name
  description = "The database name"
}

output "environment" {
  value = var.environment
  description = "Environment for the resources"
  
}