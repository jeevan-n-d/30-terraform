
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
