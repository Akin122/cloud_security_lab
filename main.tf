# Day 8/30: CIS-Hardened S3 Bucket for Cloud Security Lab

#checkov:skip=CKV2_AWS_62:Event notifications not required for Day 7 lab
#checkov:skip=CKV2_AWS_61:Lifecycle policies not required for Day 7 lab
#checkov:skip=CKV_AWS_18:Logging requires separate bucket - Day 9 topic
#checkov:skip=CKV_AWS_144:CRR not required for lab environment
resource "aws_s3_bucket" "security_lab_bucket" {
  bucket = "cloudsec-lab-akin122-${formatdate("YYYYMMDD", timestamp())}"

  tags = {
    Name        = "CloudSec Lab Bucket"
    Environment = "Lab"
    Day         = "8"
    Owner       = "Akin"
  }
}

resource "aws_s3_bucket_public_access_block" "security_lab_bucket_pab" {
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

#checkov:skip=CKV_AWS_145:Using AWS managed KMS key for Day 7, custom KMS is Day 10
#checkov:skip=CKV2_AWS_32:AWS managed KMS key acceptable for lab
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.security_lab_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}
