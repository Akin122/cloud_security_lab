#checkov:skip=CKV2_AWS_62:Event notifications not required for Day 7 lab
#checkov:skip=CKV2_AWS_61:Lifecycle policies not required for Day 7 lab
#checkov:skip=CKV_AWS_18:Logging requires separate bucket - Day 9 topic
#checkov:skip=CKV_AWS_144:CRR not required for lab environment
# Day 7/30: CIS-Hardened S3 Bucket for Cloud Security Lab

resource "aws_s3_bucket" "security_lab_bucket" {
  bucket = "cloudsec-lab-akin122-${formatdate("YYYYMMDD", timestamp())}"

  tags = {
    Name        = "CloudSec Lab Bucket"
    Environment = "Lab"
    Day         = "7"
    Owner       = "Akin"
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

#checkov:skip=CKV_AWS_145:Using AWS managed key for Day 7, custom KMS is Day 10
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.security_lab_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms" # KMS instead of AES256 to satisfy Checkov
    }
  }
}
