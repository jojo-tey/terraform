# IAM setting



## IAM settings required for Multi Account operation


1. Set backend and provider

  - `/02-iam/account-id/backend.tf`
  - `/02-iam/account-id/provider.tf`



2. Create common authority <br>

  - `/02-iam/account-id/everyone_policy.tf`
  - plan to map permissions for each group in the future.

3. Module setting

  - `/02-iam/account-id/_module_assume_policy/main.tf`
  - For multi-account setting, you need to create the necessary policies for each account.
  - Common resources are created through modules.

4. Creating a policy for accessing the production account

> This is the permission setting to use the role of the production account in the id account, so you need to create the corresponding role in the production account later. (This setting alone cannot assume.)

  - `/02-iam/account-id/assume_policy_prod.tf`

5. Create groups and users for each team

> group_account_devops_black <br>
> A group of users who can use admin privileges in all accounts

> group_account_devops_white <br>
> Group of users with readonly access to all accounts

  - `/02-iam/account-id/group_devops_black.tf`
  - `/02-iam/account-id/group_devops_black.tf`

6. Create resource

  - terraform init
  - terraform plan -parallelism=30
  - terraform apply -parallelism=30

7. Set password

  - `Set an initial password on AWS console` for the user created with Terraform
  - After setting, inform the user of the ID and password, and request password change and MFA setup

--- 

## Set password and MFA (User)

  - Login with IAM username and password got from admin
  - Set new password and MFA
  - To proceed with Device MFA, OTP applications such as Authy and Google Authenticator are required
  - Create Access Key

---

## Set Production account

  - `/02-iam/account-prod/backend.tf`
  - `/02-iam/account-prod/provider.tf`

  - Create a role to Assume in your ID account
  - This can be repeated if you need more account
  - To create a new account, you must have a reset account created earlier

1. Assume Role <br>

  - `/02-iam/account-prod/assume-account-prod-admin-with-account-id.tf`
  - `/02-iam/account-prod/assume-account-prod-readonly-with-account-id.tf`
  - Create a role to Assume in id account
  - In ID, we created admin and readonly, so create roles accordingly


2. Variables definition and setting

  - Define needed variables in `variables.tf`
  - Define values in `terraform.tfvars`

3. Create resource

  - terraform init
  - terraform plan -parallelism=30
  - terraform apply -parallelism=30

4. Delete initial IAM User when Users are all set up

  - After the administrator has set up their identities, there is no need for an initializing IAM user anymore.
  - It is recommended to delete unnecessary resources to match the Terraform structure as much as possible.