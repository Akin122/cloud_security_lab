# Day 16: GuardDuty enablement
resource "aws_guardduty_detector" "main" {
  enable = true
  
  tags = {
    Name = "cloudsec-lab-guardduty"
    Day  = "16"
  }
}
