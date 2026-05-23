## 30 Days of Cloud Security Labs

### Day 13/30: Enforce MFA and Password Policy
Created Terraform to enforce MFA for destructive actions and set strong password policy.
14-char, complexity, 90-day rotation.
[Code](./day13_mfa_enforcement.tf)

### Day 12/30: Secure IAM Role for EC2
Created IAM role with least-privilege S3 read-only access using Terraform.
No hardcoded credentials. Verified with AWS CLI on EC2.
[Code](./day12_ec2_role.tf)

# Day 6/30: CIS 2.2 - Public AMI Audit with Terraform

Audited my AWS account against CIS Benchmark 2.2 control 2.2.1 to ensure no public AMIs exist.  
Built with Terraform and AWS CLI. Result: PASS ✅

## How to Run
1. `terraform init`
2. `terraform plan`
3. Check output for `public_amis` and `cis_2_2_status`
