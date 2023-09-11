# Terraform Block
terraform {
  required_version = ">= 1.4" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
  access_key = "AKIA3TAMK6ZMEV4BJ3PX"
  secret_key = "olddkq/p3Qa8S03SOsQw/FxbpluZ28g0KBYVWJ0F"
}




/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
