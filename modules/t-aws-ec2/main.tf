resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  user_data     = var.user_data
  subnet_id     = var.subnet-id
  monitoring    = var.isMonitored
}
