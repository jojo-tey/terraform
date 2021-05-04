# KMS

## Create Custom key

- It is recommended to use different keys for security
- IAM allows you to restrict access to KMS keys, so you can manage your permissions more finely
- If you have a security account, it is best to create a KMS Custom Key in the security account and grant permission through Cross Account
- KMS custom keys are often referenced when using other resources, so it's important to organize them into output

1. Create Deployment Common key

- `06-kms/account-prod/deployment_common.tf` 
- `06-kms/account-id/deployment_common.tf` 
- Create the public key for Deployment

2. Define outputs

- `06-kms/account-prod/outputs.tf` 
- `06-kms/account-id/outputs.tf` 
- Since output is often used when creating other resources, it is recommended to organize it with certain rules
  - aws_kms_key_<env>_<region>_<key_name>_arn
- Outputs can be used for public use, so it is convenient to use Soft Link after removing them to the upper folder
  - `ln -s ../outputs.tf`

3. Add in Global variable 

- - `03-variables/var_global.tf` 
- KMS backend information is registered in a global variable so that it can be easily used by other resources



