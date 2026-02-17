terraform {
  backend "s3" {
    bucket = "my-tf-test-bucket-jeeva-01"
    key = "dev/terraform.tfstate"
    region = "ap-south-1" 
    use_lockfile = true
  }
}

resource "aws_s3_bucket_versioning" "backend_version" {
  bucket = "my-tf-test-bucket-jeeva-01"

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state_lock" {
  bucket="my-tf-test-bucket-jeeva-01"
  rule {
    apply_server_side_encryption_by_default {
  sse_algorithm = "AES256"
    }
  }
}