variable "namespace" {
  type = string
  description = "The project namespace for resource naming"
  default = "terraform_exam"
}

variable "environment" {
  type = string
  default = "dev"
  description = "Environment name for deployment"  
}

variable "region" {
  type = string
  default = "eu-west-3"
  description = "AWS region for resource deployment"
}
variable "vpc_id" {
  type = string
  default = ""
  description = "VPC ID for the deployment"
}
  
variable "vpc_cidr" {
  type = string
  default = ""
  description = "VPC CIDR for the deployment"
}