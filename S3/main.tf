
terraform {
  backend "s3" {
    bucket = "djfans-static"
    key    = "example/terraform.state"
    region = "eu-central-1"
  }
}
