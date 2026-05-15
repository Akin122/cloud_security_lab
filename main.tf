resource "aws_s3_bucket" "security_lab_bucket" {
  bucket = "cloudsec-lab-akin122-${formatdate("YYYYMMDD", timestamp())}"
}

resource "aws_s3_bucket_public_access_block" "secure_bucket" {
  bucket = aws_s3_bucket.security_lab_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
