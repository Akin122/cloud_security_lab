resource "aws_iam_role" "ec2_s3_readonly" {
  name = "ec2-s3-readonly-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "s3_readonly_attach" {
  role       = aws_iam_role.ec2_s3_readonly.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-s3-readonly-profile"
  role = aws_iam_role.ec2_s3_readonly.name
}

resource "aws_instance" "demo_ec2" {
  ami                   = "ami-0c02fb559556c7d316" # Amazon Linux 2023 in us-east-1. Change if needed
  instance_type         = "t2.micro"
  iam_instance_profile  = aws_iam_instance_profile.ec2_profile.name
  monitoring            = true

  metadata_options {
    http_tokens   = "required"  # Disables IMDSv1, forces IMDSv2
    http_endpoint = "enabled"
  }

  root_block_device {
    encrypted  = true
    kms_key_id = null  # Uses default AWS EBS KMS key
  }

  ebs_optimized = true

  tags = {
    Name = "day12-least-privilege-ec2"
  }
}
