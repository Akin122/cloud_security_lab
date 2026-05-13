terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami_ids" "my_amis" {
  owners = ["self"]
}

data "aws_ami" "ami_details" {
  for_each = toset(data.aws_ami_ids.my_amis.ids)
  owners   = ["self"]
  filter {
    name   = "image-id"
    values = [each.key]
  }
}

output "ami_audit_results" {
  value = {
    total_amis_found = length(data.aws_ami_ids.my_amis.ids)
    public_amis = [
      for ami_id, ami in data.aws_ami.ami_details : {
        ami_id        = ami.id
        ami_name      = ami.name
        public        = ami.public
        creation_date = ami.creation_date
        status        = ami.public ? "FAIL - PUBLIC AMI FOUND" : "PASS - Private"
      } if ami.public
    ]
    cis_2_2_status = length([for ami in data.aws_ami.ami_details : ami if ami.public]) == 0 ? "PASS" : "FAIL"
  }
}
