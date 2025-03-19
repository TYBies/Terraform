  variable "namespace" {
    description = "Namespace for the resources"
    type        = string
    default     = "terraform-exam"
  }
  variable "engine_version" {
    description = "Version of the database engine"
    type        = string       
    default     = "8.0.35"
  }
  variable "instance_class" {
    description = "Instance class of the database"
    type        = string
    default     = "db.t3.micro"
  }
  variable "db_name" {
    description = "Name of the database"
    type        = string
    default     = "wordpress_db"
  }
  variable "db_username" {
    description = "Username of the database"
    type        = string
    default     = "root"
  }
  variable "db_password" {
    description = "Password of the database"
    type        = string
    default     = "password"
  }
  variable "environment" {
    description = "Environment for the resources"
    type        = string
    default     = "dev"    
  }
  variable "engine" {
    description = "Database engine"
    type        = string
    default     = "mysql"
  }
  variable "allocated_storage" {
    description = "Allocated storage for the database"
    type        = number
    default     = 20
  }
  variable "sg_rds_id" {
    description = "Security group ID for the database"
    type        = string    
  }
  variable "subnet_ids" {
    description = "Subnet IDs for the database"
    type        = list(string)
  }
  variable "vpc_security_group_ids" {
    description = "Security group IDs for the database"
    type        = list(string)    
  }
    
  