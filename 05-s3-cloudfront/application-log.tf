resource "aws_s3_bucket" "apps_logs_bucket" {
  bucket = "${var.account_namespace}-prod-apps-logs-dayonepapne2"
  acl    = "log-delivery-write"

  lifecycle_rule {
    enabled = true
    transition {
      days          = 1
      storage_class = "INTELLIGENT_TIERING"
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "ONEZONE_IA"
    }

    transition {
      days          = 180
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }
}
