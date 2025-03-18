variable "namespace" {
  type        = string
  description = "The project namespace for resource naming"
  default     = "terraform-exam"
}
variable "region" {
  type        = string
  description = "The region for the resources"
  default     = "us-east-1"
}
variable "environment" {
  type        = string
  description = "The environment for the resources"
  default     = "dev"  
}

