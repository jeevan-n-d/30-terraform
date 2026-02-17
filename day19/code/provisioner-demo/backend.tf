terraform {
  backend "s3" {
    bucket = "my-tf-test-bucket-jeeva-01"
    key    = "terraform-day19.tfstate"
    region = "ap-south-1"
  }
}
