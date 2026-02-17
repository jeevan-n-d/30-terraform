terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami="ami-00ca570c1b6d79f36"
  instance_type = "t2.micro"

  tags = {
    "Name"="sample"
    "managed"="tf"
  }
}
