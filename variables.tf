variable "namespace" {
  type        = string
  description = "The project namespace for resource naming"
  default     = "terraform-exam"
}
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string  
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string   
  default     = "vpc-1000" 
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "wordpress_db"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true

}
variable "ebs_size" {
  description = "Size of the EBS volume in GB"
  type        = number
  default     = 8  
}
variable "availability_zone" {
  description = "Availability zone"
  type        = list(string)
  default     = ["us-west-2a"]
  
}