# Terraform Block
terraform {
  required_version = ">= 1.4" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.6"
    }
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
  shared_credentials_files  = ["%USERPROFILE%/.aws/credentials"]

}




/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
