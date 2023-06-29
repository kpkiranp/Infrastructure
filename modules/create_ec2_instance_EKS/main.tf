# Creation of EC2 instance to interact with EKS Cluster

resource "aws_instance" "EKS_instance" {
  ami = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  key_name = var.ec2_key_name
  vpc_security_group_ids = [var.ec2_security_group]
  subnet_id = var.ec2_public_subnet_id
  tags = {
    Name = "EKS_instance"
  }
}