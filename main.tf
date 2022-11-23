#1)Create an EC2 instance with Custom security group(ingress allow 22) Custom VPN(/16) with 2 subnet
#2)Create an IAM Role with S3Readonly policy
#3)Asign above created role to EC2 

terraform {
  #required_version = ""
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.40.0"
    }
  }
    backend "s3" {
    bucket = "pman05tfbackendbckt"
    key = "Development/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "pman05-tf-table"
  }
}

provider "aws" {
  region = "us-east-1"
  #profile = "default"
}



