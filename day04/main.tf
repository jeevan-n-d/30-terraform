terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket = "my-tf-test-bucket-jeeva-01"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }
}


# Create a S3 bucket
resource "aws_s3_bucket" "first-bucket" {
  bucket = "my-tf-test-bucket-jeeva-002"

  tags = {
    Name        = "My bucket 2.0 "
    Environment = "Dev"
  }
}