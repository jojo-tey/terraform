terraform {
  required_version = "0.12.24"

  backend "s3" {
    bucket         = "account-prod-eucentral1-tfstate"
    key            = "08-route53/account-prod/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

