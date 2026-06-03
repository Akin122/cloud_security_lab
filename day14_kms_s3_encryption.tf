# Day 14: KMS CMK + S3 Server-Side Encryption

# 1. Create Customer Managed Key - YOU control this, not AWS
resource "aws_kms_key" "s3_cmk" {
  description             = "Day 14: CMK for S3 bucket encryption"
  deletion_window_in_days = 10
  enable_key_rotation     = true  # Auto-rotate yearly = CIS compliance
  tags = { 
    Day = "14", 
    Project = "cloud_security_lab" 
  }
}

# 2. Alias makes the key easier to read in console
resource "aws_kms_alias" "s3_alias" {
  name          = "alias/s3-day14-cmk"
  target_key_id = aws_kms_key.s3_cmk.key_id
}

# 3. S3 bucket with CMK encryption enforced
resource "aws_s3_bucket" "secure_bucket" {
  bucket = "akin122-secure-day14-${random_id.bucket_id.hex}"
  tags = { Day = "14" }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

# 4. This is the key part: Force all objects to use CMK
resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.secure_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_cmk.arn  # Use CMK, not aws/s3
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = true  # Reduces KMS cost
  }
}

# 5. Block public access - CIS 2.1.3
resource "aws_s3_bucket_public_access_block" "secure" {
  bucket = aws_s3_bucket.secure_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
