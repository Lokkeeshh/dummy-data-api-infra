terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "ecs/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "your-terraform-lock-table"
  }
}

provider "aws" {
  region = "us-east-1"
}


# S3 is used for Terraform state storage.
# DynamoDB is used for state locking.