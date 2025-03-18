# deployment environment
variable "namespace" {
  description = "The project namespace to be used for unique resource naming"
  type        = string
  default = "terraform_exam"
}
variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

variable "public_ip" {
  type    = string
  default = ""
  
}
variable "ec2_public_id" {
  type    = string
  default = ""  
}

variable "ec2_instance_id" {
  type    = string
  default = ""    
}

variable "image_id" {
  type     = string
  nullable = false
  default = "ami-064736ff8301af3ee"
}

variable "monitoring" {
  type    = bool
  default = false
}

variable "db_type_instance" {
  type    = string
  default = "db.t3.micro"
  
}

variable "root_block_device" {
  type    = string
  default = "/dev/sda1"
}

variable "ebs_size" {
  type    = number
  default = "5"
}

variable "ebs_device_name" {
  type    = string
  default = "/dev/sdh"  
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-3"
}

variable "key_name" {
  description = "The SSH key pair name for EC2 instances"
  type        = string
  default = "terraform_exam_keypair"
}

variable "sg_pub_id" {
  description = "Public security group ID"
  type        = string
}

#variable "sg_rds_id" {
  #description = "RDS security group ID"
  #type        = string  
#}

variable "environment" {
  type        = string
  default     = "dev"
  description = "The environment to deploy to"
}

variable "availability_zone" {
  type    = list(any)
  default = ["eu-west-3a"]
}

variable "subnet_ids" {
  type    = list(any)
  default = []
}
variable "instance_type" {
  type    = string
  default = "t2.micro"  
}
variable "instance_name" {
  type    = string
  default = "terraform_exam_instance"
}
variable "instance_id" {
  type    = string
  default = ""  
}