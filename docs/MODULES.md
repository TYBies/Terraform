# Module Documentation

This document provides details for the main Terraform modules in this repository. Please update these sections as you modify or add modules.

---

## VPC Module

**Inputs:**
- `vpc_cidr` (string): The CIDR block for the VPC.
- `azs` (list): List of availability zones.

**Outputs:**
- `vpc_id` (string): The ID of the created VPC.

**Usage Example:**
```hcl
module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  azs      = ["us-east-1a", "us-east-1b"]
}
```

---

## EC2 Module

**Inputs:**
- `instance_type` (string): EC2 instance type.
- `key_name` (string): Name of the SSH key pair.

**Outputs:**
- `autoscaling_group_id` (string): The ID of the Auto Scaling Group.

**Usage Example:**
```hcl
module "ec2" {
  source        = "./modules/ec2"
  instance_type = "t3.micro"
  key_name      = "my-key"
}
```

---

## RDS Module

**Inputs:**
- `db_username` (string): Master username.
- `db_password` (string): Master password.
- `db_instance_class` (string): RDS instance size.

**Outputs:**
- `db_endpoint` (string): Endpoint for connecting.

**Usage Example:**
```hcl
module "rds" {
  source           = "./modules/rds"
  db_username      = "root"
  db_password      = "supersecure"
  db_instance_class = "db.t3.micro"
}
```

---

## ALB Module

**Inputs:**
- `alb_name` (string): Name for the Application Load Balancer.
- `subnets` (list): Subnets for the ALB.

**Outputs:**
- `alb_dns_name` (string): DNS name of the ALB.

**Usage Example:**
```hcl
module "alb" {
  source   = "./modules/alb"
  alb_name = "wordpress-alb"
  subnets  = ["subnet-1234abcd", "subnet-5678efgh"]
}


