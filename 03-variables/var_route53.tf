variable "r53_variables" {
  default = {
    prod = {
      account_io_zone_id = ""

      star_account_io_acm_arn_apnortheast2 = ""
      star_account_io_acm_arn_useast1      = ""
      www_account_io_acm_arn_useast1       = ""
    }
  }
}
