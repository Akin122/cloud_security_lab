# Day 19/30: Network Segmentation + Security Groups with Terraform

**Objective:** Build public + private subnets and lock them down with Security Groups.

**What I built:**
- VPC: 10.0.0.0/16 with DNS hostnames
- Public Subnet: 10.0.1.0/24 for internet-facing resources
- Private Subnet: 10.0.2.0/24 for backend resources  
- Security Group: Allow HTTP port 80 from 0.0.0.0/0 only

**SOC Lesson:** Defense in depth. Public servers stay public, databases stay private. SGs = cloud firewalls.

**Commands:**
terraform init
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve

**Status:** Day 19/30 complete 
