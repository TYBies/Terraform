variable "namespace" {
  type        = string
  description = "The project namespace for resource naming"
  default     = "terraform-exam"
}
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
variable "region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-1"
  
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
  
}

