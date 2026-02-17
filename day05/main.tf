terraform {
 required_providers {
   aws = {
    source = "hashicorp/aws"
    version = "~> 6.0"
   }
 } 
}



provider "aws" {
    region = "ap-south-1"
}

variable "environment" {

  default = "dev"
  
}

variable "my_name" {
  default = "my-tf-jeeva"
}

variable "regions" {
  default = "ap-south-1"
}


locals {
  env = var.environment
  bucket_name = "${var.my_name}-${var.environment}-bucket"
  vpc_name = "${var.my_name}-${var.environment}-VPC"
  ec2_name= "${var.my_name}-${var.environment}-ec2"
  tag="my-terraform"
}


resource "aws_s3_bucket" "first-bucket" {
  bucket = local.bucket_name

  tags={
    Name = local.bucket_name
    Environment = var.environment
  }
}


resource "aws_vpc" "sample"{
  cidr_block = "10.0.0.0/16"
  region = var.regions
  tags =  {
    Environment = var.environment
    Name = local.vpc_name
  }
}

resource "aws_instance" "example" {
  ami="ami-0dee22c13ea7a9a67"
  instance_type = "t2.micro"
  region = var.regions
  
    tags =  {
    Environment = "${var.environment}-ec2"
    Name = local.ec2_name
  }
}

output "vpc_id" {
  value=aws_vpc.sample.id
}

output "ec2_id" {
  value=aws_instance.example.id
}

output "s3_id" {
  value=aws_s3_bucket.first-bucket.id
}


output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.first-bucket.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.first-bucket.arn
}


output "environment" {
  description = "Environment from input variable"
  value       = var.environment
}


output "tags" {
  description = "Tags from local variable"
  value       = local.tag
}