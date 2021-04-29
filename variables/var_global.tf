variable "remote_state" {
  default = {
    # VPC
    vpc = {
      dayonedapne2 = {
        region = "ap-northeast-2"
        bucket = "dayone-prod-apnortheast2-tfstate"
        key    = "dayone/terraform/vpc/dayoned_apnortheast2/terraform.tfstate"
      }

      dayonepapne2 = {
        region = "ap-northeast-2"
        bucket = "dayone-prod-apnortheast2-tfstate"
        key    = "dayone/terraform/vpc/dayonep_apnortheast2/terraform.tfstate"
      }
    }


    # WAF ACL
    waf_web_acl_global = {
      prod = {
        region = ""
        bucket = ""
        key    = ""
      }
    }


    # AWS IAM
    iam = {
      prod = {
        region = "ap-northeast-2"
        bucket = "dayone-prod-apnortheast2-tfstate"
        key    = "dayone/terraform/iam/dayone-prod/terraform.tfstate"
      }
    }


    # AWS KMS
    kms = {
      prod = {
        apne2 = {
          region = ""
          bucket = ""
          key    = ""
        }
      }
    }
  }
}
