terraform {
  required_version = "= 0.12.24" # Terraform Version 

  backend "s3" {
    bucket         = "account-id-eucentral1-tfstate" # Set bucket name 
    key            = "02-iam/account-id/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "terraform-lock" # Set DynamoDB Table
  }
}
