/*
resource "aws_key_pair" "deploy" {
  key_name   = "Terraform-test"
  public_key = "ssh-rsa "
} 
*/

variable "key_name" {}

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "${var.key_name}"
  public_key = "${tls_private_key.example.public_key_openssh}"
}