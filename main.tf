# Day 7/30: CIS-Hardened S3 Bucket for Cloud Security Lab

resource "aws_s3_bucket" "security_lab_bucket" {
  bucket = "cloudsec-lab-akin122-${formatdate("YYYYMMDD", timestamp())}"
  
  tags = {
    Name        = "CloudSec Lab Bucket"
    Environment = "Lab"
    Day         = "7"
    Owner       = "Nuel"
  }
}

resource "aws_s3_bucket_public_access_block" "secure_bucket" {
  bucket = aws_s3_bucket.security_lab_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.security_lab_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.security_lab_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_logging" "logging" {
  bucket = aws_s3_bucket.security_lab_bucket.id

  target_bucket = aws_s3_bucket.security_lab_bucket.id
  target_prefix = "access-logs/"
}
