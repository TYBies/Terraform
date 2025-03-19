
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_key_pair" "terraform_exam_key" {
  key_name   = "terraform_exam_keypair"
  public_key = file("${path.root}/terraform_exam_keypair.pub")  # Make sure this file exists
}

# WordPress instance in public subnet
resource "aws_instance" "ec2_public" {
  ami = data.aws_ami.amazon-linux-2.id 
  instance_type = var.instance_type
  count = var.environment == "dev" ? 2 : 3
  key_name = var.key_name
  subnet_id     = element(var.subnet_ids, count.index % length(var.subnet_ids))  # Changed from var.vpc.public_subnets
  vpc_security_group_ids = [var.sg_pub_id]
  user_data = file("${path.module}/install_wordpress.sh")
  monitoring = var.monitoring
  associate_public_ip_address = true

    tags = {
    "Name" = "${var.namespace}-EC2-PUBLIC-${count.index + 1}"
    "Environment" = var.environment
  } 
  root_block_device {
    encrypted = true
  }
}
