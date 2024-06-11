# Terraform Settings Block
terraform {
  # Terraform Version
  required_version = "~> 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " ~> 5.53.0"
    }
    # Random Provider
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    } # Terraform block
  }
}

terraform {
  backend "s3" {
    bucket = "pandu-tfstate"
    key    = "jaiganesh-lifecycle-prevent-destroy"
    region = "us-east-1"
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
  alias   = "us-west-1"
}

/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
