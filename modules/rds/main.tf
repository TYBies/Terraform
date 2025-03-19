resource "aws_db_instance" "wordpress_db" {
  
  identifier             =  "terraform-exam-rds-${var.environment}-${count.index + 1}"
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  count                  = 2
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids =  [var.sg_rds_id]

  skip_final_snapshot    = true
  publicly_accessible    = false
  multi_az               = var.environment == "prod" ? true : false  
  storage_encrypted      = true
  deletion_protection    = false

  tags = {
    "Name"        = "${var.namespace}-wordpress-db"
    "Environment" = var.environment
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.namespace}-rds-subnet-group-${var.environment}"
  subnet_ids = var.subnet_ids
}
