# Provider configuration separated for clarity.
variable "aws_region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "ap-south-1"
}

provider "aws" {
  region = "ap-south-1"
}

# NOTE: If you want to use a remote backend (S3 + DynamoDB) place config in backend.tf
