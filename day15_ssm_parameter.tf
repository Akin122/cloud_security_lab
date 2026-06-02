# SSM Parameter Store - SecureString example
resource "aws_ssm_parameter" "db_password" {
  name        = "/cloud_security_lab/dev/db_password"
  description = "Day 15 lab - DB password stored in SSM"
  type        = "SecureString"
  value       = "SuperSecret123!" # Use a fake value for lab
  overwrite   = true

  tags = {
    Day   = "15"
    Owner = "Akin122"
  }
}
