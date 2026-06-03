# 30 Days of AWS SOC | Building in Public 🔒

Hands-on AWS Security labs implementing CIS AWS Foundations Benchmark v2.2 & v2.3 using Terraform.  
**Status**: Day 18/30 complete | **Goal**: SOC Analyst role

### Week 3: Networking & Logging - Current
**Day 18/30: VPC Basics with Terraform 🌐**  
Built public + private subnets, Security Groups, NACLs. Defense in depth: SGs = instance firewall, NACLs = subnet firewall.  
[Code](day18_vpc.tf)

**Day 17/30: CloudTrail Multi-Region Logging 📊**  
Multi-region trail `akin-soc-trail` with KMS encryption + log file validation. Foundation for GuardDuty + Security Hub.  
[Code](day17_cloudtrail.tf)

**Day 16/30: Terraform Lifecycle + Incident Response 💻**  
Built infra with Terraform, then `terraform destroy`. All actions logged in CloudTrail for forensic analysis.  
[Code](day16_guardduty.tf)

**Day 15/30: Secrets Management 🔐**  
AWS Secrets Manager vs SSM Parameter Store. Removed hardcoded credentials from code. SOC lesson: auto-rotation.  
[Code](day15_secrets_manager.tf) [Code](day15_ssm_parameter.tf)

### Week 2: IAM & Data Protection - Complete
**Day 14/30: KMS CMK + S3 SSE-KMS Encryption 🔑**  
Customer Managed Key + S3 bucket policy to reject unencrypted uploads.  
[Code](day14_kms_s3_encryption.tf)

**Day 13/30: MFA Enforcement 🛡️**  
Terraform to enforce MFA for destructive actions + strong password policy.  
[Code](day13_mfa_enforcement.tf)

**Day 12/30: Secure IAM Role for EC2 🔒**  
Least-privilege IAM role for EC2 instead of root credentials.  
[Code](day12_ec2_role.tf)

### Week 1: Foundation & Auditing - Partial
**Day 6/30: CIS 2.2 Public AMI Audit ✅**  
Audited account for public AMIs using Terraform + AWS CLI. Result: PASS  
[Code](day5-cis-2.2-public-ami-audit/)

*Day 1-5, 7-11: AWS CLI setup, IAM basics, S3 security - Labs coming soon*

### How to Run
1. `terraform init`
2. `terraform plan` 
3. `terraform apply`

### What I’m building
CIS AWS Foundations, Least Privilege, IaC Security, CloudTrail Forensics, Secrets Management
