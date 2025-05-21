output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.my_ec2.public_ip
}

output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.my_ec2.id
}
