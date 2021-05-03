# Variables

## Global variable?

- Global variables are a collection of values that are frequently referenced when creating other resources. The examples below are collected from a subjective point of view, so you can use them conveniently if you add them as needed.
- You can put variables one by one when you use them later.

1. Define Global variable

- `/03-variables/var_global.tf`

- var_global.tf contains the following:
  - Account ID
  - VPC(Amazon Virtual Private Cloud)
  - IAM(AWS Identity and Access Management)
  - WAF(AWS Web Application Firewall)
  - KMS(Amazon Key Management Service)

2. Define variables relate Domain

- `/03-variables/var_route53.tf`

- var_route53.tf contains the following:
  - Route53 Zone ID
  - ACM(Amazon Certificate Manager)

3. Using Global variable

- In order to use the global variable defined in the upper folder, the relevant file must be moved to the directory
- At this time, a soft link is created and used for efficient code operation

> If you give the -R option to the cp command when copying the code, the soft link is copied as it is.

```
# Use Soft Link
$ ln -s ../path/to/variables/var_route53.tf
$ ln -s ../path/to/variables/var_global.tf
```