output "bucket_names" {
  value = [for b in aws_s3_bucket.bucket1: b.bucket]
}

output "bucket_ids" {
  value = [for b in aws_s3_bucket.bucket1 : b.id]
}
