
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