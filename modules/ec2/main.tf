
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

# WordPress instance in public subnet
resource "aws_instance" "ec2_public" {
  ami = data.aws_ami.amazon-linux-2.id 
  instance_type = var.instance_type
  count = var.environment == "dev" ? 2 : 3
  key_name = var.key_name
  subnet_id = element(var.vpc.public_subnets, count.index)
  vpc_security_group_ids = [var.sg_pub_id]
  user_data = file("../install_wordpress.sh")
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
