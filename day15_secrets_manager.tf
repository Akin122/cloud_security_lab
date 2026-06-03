# Secrets Manager - basic secret
resource "aws_secretsmanager_secret" "api_key" {
  name        = "cloud_security_lab/dev/api_key_v2"
  description = "Day 15 lab - API key stored in Secrets Manager"
  
  tags = {
    Day   = "15"
    Owner = "Akin122"
  }
}

resource "aws_secretsmanager_secret_version" "api_key_value" {
  secret_id     = aws_secretsmanager_secret.api_key.id
  secret_string = jsonencode({ api_key = "lab_api_key_abc123" })
}

# Optional: rotation config. Skip this for now if no Lambda ready
# resource "aws_secretsmanager_secret_rotation" "api_key_rotation" {
#   secret_id           = aws_secretsmanager_secret.api_key.id
#   rotation_lambda_arn = aws_lambda_function.rotate.arn
#   rotation_rules {
#     automatically_after_days = 30
#   }
# }
