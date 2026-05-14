# Day 6/30: CIS 2.2 - Public AMI Audit with Terraform

Audited my AWS account against CIS Benchmark 2.2 control 2.2.1 to ensure no public AMIs exist.  
Built with Terraform and AWS CLI. Result: PASS ✅

## How to Run
1. `terraform init`
2. `terraform plan`
3. Check output for `public_amis` and `cis_2_2_status`
