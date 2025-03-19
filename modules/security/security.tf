# WordPress Public Security Group
resource "aws_security_group" "wordpress_public" {
  name        = "${var.environment}-wordpress-public-sg"
  description = "Security group for public WordPress instances"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
  description = "SSH from Admin"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"] # ToDo:not safe. Replace with your actual IP from Admin
}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.environment}-wordpress-public-sg"
    Description = "Security group for public WordPress instances"    
  }

}

# RDS Security Group
resource "aws_security_group" "rds" {
  vpc_id = var.vpc_id
  name        = "${var.environment}-rds-sg"
  description = "Security group for RDS instance" 

  ingress {
    description     = "MySQL from WordPress"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.wordpress_public.id]# Allow MySQL from WordPress EC2 instances in Public SG
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-rds-sg"
    Description = "Security group for RDS instance"    
  }
 
}

