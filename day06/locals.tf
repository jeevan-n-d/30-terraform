
locals {
  env = var.environment
  bucket_name = "${var.my_name}-${var.environment}-bucket"
  vpc_name = "${var.my_name}-${var.environment}-VPC"
  ec2_name= "${var.my_name}-${var.environment}-ec2"
  tag="my-terraform"
}