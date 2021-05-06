variable "sg_variables" {
  default = {

    ec2 = {
      tags = {
        account = {
          Name    = "hello-account-prod_eucentral1-ec2-sg"
          app     = "hello"
          project = "hello"
          env     = "prod"
          stack   = "account-prod_eucentral1"
        },

        account = {
          Name    = "hello-account-prod_eucentral1-ec2-sg"
          app     = "hello"
          project = "hello"
          env     = "prod"
          stack   = "account-prod_eucentral1"
        }
      }
    }

    external_lb = {
      tags = {
        artdapne2 = {
          Name    = "hello-account-prod_eucentral1-external-lb-sg"
          app     = "hello"
          project = "hello"
          env     = "prod"
          stack   = "account-prod_eucentral1"
        },
        artpapne2 = {
          Name    = "hello-account-prod_eucentral1-external-lb-sg"
          app     = "hello"
          project = "hello"
          env     = "prod"
          stack   = "account-prod_eucentral1"
        }
      }
    }
  }
}
