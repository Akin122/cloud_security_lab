resource "aws_cloudtrail" "akin_soc_trail" {
  name                          = "akin-soc-trail"
  s3_bucket_name                = aws_s3_bucket.cloudtrail_logs.id
  enable_log_file_validation    = true
  is_multi_region_trail         = true
  kms_key_id                    = aws_kms_key.cloudtrail_key.arn
}
