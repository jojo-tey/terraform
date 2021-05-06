# Atlantis user
variable "atlantis_user" {
  description = "The username that will be triggering atlantis commands. This will be used to name the session when assuming a role. More information - https://github.com/runatlantis/atlantis#assume-role-session-names"
  default     = "atlantis_user"
}

# Account IDs
# Add all account ID to here 
variable "account_id" {
  default = {
    prod = "xxxxxxxxxx"
  }
}

# Remote State that will be used when creating other resources
# You can add any resource here, if you want to refer from others
variable "remote_state" {
  default = {
    # VPC
    vpc = {
      account-dev = {
        region = "eu-central-1"
        bucket = "account-id-eucentral1-tfstate"
        key    = "account/terraform/vpc/account-id_eucentral1/terraform.tfstate"
      }

      account-prod = {
        region = "ap-northeast-2"
        bucket = "account-prod-apnortheast2-tfstate"
        key    = "account/terraform/vpc/account-prod_eucentral1/terraform.tfstate"
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
        region = "eu-central-1"
        bucket = "account-prod-eucentral1-tfstate"
        key    = "account/terraform/iam/account-prod/terraform.tfstate"
      }
    }


    # AWS KMS
    kms = {
      prod = {
        account = {
          region = ""
          bucket = ""
          key    = ""
        }
      }
    }
  }
}
