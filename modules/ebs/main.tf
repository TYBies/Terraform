resource "aws_ebs_volume" "terraform_exam_ebs" {
  count = length(var.instance_ids)
  availability_zone = var.availability_zone[count.index]  # Now correctly accessing list element
  size              = var.ebs_size 
  tags = {
    Name = "${var.ebs_name}-${count.index + 1}"
  }
}

resource "aws_volume_attachment" "terraform_exam_ebs_att" {
  count       = length(var.instance_ids) 
  device_name = var.ebs_device_name
  volume_id   = aws_ebs_volume.terraform_exam_ebs[count.index].id  # Use count.index to reference the volumes
  
  instance_id = var.instance_ids[count.index]  
}

