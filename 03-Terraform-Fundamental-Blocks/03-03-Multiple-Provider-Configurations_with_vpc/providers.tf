# Terraform block
terraform {
  required_version = "~> 1.5.0"
  required_providers {
    aws ={
        source = "hashicorp/aws"
        version = " ~> 2.15.0"
    }
  } 
}
provider "aws" {
  region = "us-east-1"
  # Security Static Credentials
  profile = "default"
}
provider "aws" {
  region = "us-west-1"
  # Security Static Credentials
  profile = "default"
  alias = "us-west-1"
}

/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/