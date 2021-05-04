terraform {
  required_version = "= 0.12.24"

  backend "s3" {
    bucket         = "account-prod-eucentral1-tfstate"
    key            = "06-kms/account-prod/prod_eucantral1/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
