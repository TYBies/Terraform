resource "aws_ebs_volume" "terraform_exam_ebs" {
  availability_zone = var.availability_zone[0]
  count = 2
  size              = var.ebs_size 
  tags = {
    Name = var.ebs_name
  }
}

resource "aws_volume_attachment" "terraform_exam_ebs_att" {
  count       = 2  # Attach 2 volumes
  device_name = var.ebs_device_name
  volume_id   = aws_ebs_volume.terraform_exam_ebs[count.index].id  # Use count.index to reference the volumes
  
  instance_id = aws_instance.terraform_exam_instance[count.index].id  # Use count.index to reference the instances
  
}
resource "aws_ebs_volume" "ebs_root" {
  availability_zone = var.availability_zone
  size             = var.ebs_size
  encrypted        = true
}
