output "EKS_ec2_public_ip_address" {
  value = aws_instance.EKS_instance.public_ip
}