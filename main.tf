provider "aws" {
  region = var.region
}
resource "aws_instance" "my_ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.terraform_key.key_name

  tags = {
    Name = "TerraformEC2"
  }
}
resource "tls_private_key" "generated_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-key" # This will be created in AWS
  public_key = tls_private_key.generated_key.public_key_openssh
}
resource "local_file" "private_key_pem" {
  content         = tls_private_key.generated_key.private_key_pem
  filename        = "terraform-key.pem"
  file_permission = "0400"
}
