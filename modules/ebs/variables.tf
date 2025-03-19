variable "ebs_size" {
  type    = number
  default = "5"
}

variable "ebs_device_name" {
  type    = string
  default = "/dev/sdh"  
}

variable "ebs_name" {
  type    = string
  default = "terraform_exam_ebs"
}

variable "availability_zone" {
  description = "The availability zone for the EBS volume"
  type        = list(string)  
}

variable "instance_ids" {
  description = "The EC2 instance ID that the EBS volume will be attached to"
  type        = list(string)
}

variable "environment" {
  description = "The environment for the resources"
  type        = string  
}

