resource "aws_s3_bucket" "bucket" {
  bucket = local.formatted_buc

  tags = local.newtags
}