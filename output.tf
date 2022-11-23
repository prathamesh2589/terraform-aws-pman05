output "ec2instanceARN" {
  value = aws_instance.pman_user05.id
}

output "ec2_details" {
  value = aws_instance.pman_user05.availability_zone
}