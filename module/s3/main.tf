resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  // versioning is deprecated, consider using bucket versioning in the AWS console
}

