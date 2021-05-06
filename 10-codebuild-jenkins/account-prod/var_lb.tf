variable "lb_variables" {
  default = {

    target_group_slow_start = {
      artdapne2 = 0
      artpapne2 = 0
    }

    target_group_deregistration_delay = {
      artdapne2 = 60
      artpapne2 = 60
    }

    external_lb = {
      tags = {
        artdapne2 = {
          Name    = "hello-account-prod_eucentral1-external-lb"
          app     = "hello"
          project = "hello"
          env     = "prod"
          stack   = "account-prod_eucentral1"
        },

        artpapne2 = {
          Name    = "hello-account-prod_eucentral1-external-lb"
          app     = "hello"
          project = "hello"
          env     = "prod"
          stack   = "account-prod_eucentral1"
        }
      }
    }

    external_lb_tg = {
      tags = {
        artdapne2 = {
          Name    = "hello-account-prod_eucentral1-external-tg"
          app     = "hello"
          project = "hello"
          env     = "prod"
          stack   = "account-prod_eucentral1"
        },

        artpapne2 = {
          Name    = "hello-account-prod_eucentral1-external-tg"
          app     = "hello"
          project = "hello"
          env     = "prod"
          stack   = "account-prod_apnortheast2"
        }
      }
    }
  }
}
