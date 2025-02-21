terraform {
  backend "s3" {
    bucket         = "my-terraform-backend-bucket"  # Replace with your actual S3 bucket name
    key            = "dummy-data-api/terraform.tfstate"
    region         = "us-east-1"  # Replace with your preferred region
    dynamodb_table = "terraform-locks"  # Used for state locking
    encrypt        = true
  }
}
