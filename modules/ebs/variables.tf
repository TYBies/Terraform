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
  type        = string
  default     = "eu-west-3a"
}

variable "instance_id" {
  description = "The EC2 instance ID that the EBS volume will be attached to"
  type        = string
}


variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)  
}
variable "root_block_device" {
  description = "The root block device information from the EC2 instance"
  type        = list(object({
    volume_size = number
    encrypted   = bool
  }))
}