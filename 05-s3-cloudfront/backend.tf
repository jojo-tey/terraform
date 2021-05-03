terraform {
  required_version = "= 0.12.18"

  backend "s3" {
    bucket         = "account-prod-apnortheast2-tfstate"
    key            = "05-s3/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
