# Infrastructure as code

> To practice how to manage AWS as code

[TOC]

- [Multi account](#Multi-account)
- [What is Infrastructure as Code?](#What-is-Infrastructure-as-Code?)
- [Infrastructure example](#Infrastructure-example)
  - [Initialize](#Initialize)
  - [EC2 Instance](#https://github.com/jojo-tey/terraform/tree/main/ec2_tester/README.md)
  - [S3 Bucket](#S3-Bucket)


## Multi account

AWS provides separate spaces individually. So, when configuring your environment, the most complete way to build an independent environment is to use different accounts for different environments. For multiple accounts, AWS provides a variety of functions and services, such as role assignment and AWS organization.
For example, you can configure multiple accounts like this:


- ID
The account the user logs in to to access other environments.
If you log in only with your id account, you can use your role to access other environments.
- Preprod
An account that can carry out various tests such as development/stage/load testing, etc.
- Production
Account on which infrastructure for actual service operation is deployed
- security
An account that can collect and manage only security-related services
- Log archive
Account for log collection and analysis
Various configurations are available to suit the situation.



## What is Infrastructure as Code?

Infrastructure as Code (IaS) literally means defining infrastructure as code. Usually, it provides a console to create the infrastructure, but the infrastructure created through the console is difficult to grasp the shape or track changes.
The reasons for defining the infrastructure in code are as follows:

- Version control
If documented in code, you can use the github tool for version control.
Update and rollback are convenient if you manage version
Whenever you upload a new version, you can find error points through code reviews, etc.

- Easy to understand infrastructure
You can check the configuration of the entire infrastructure through code.
When new team members come in, you can see your infrastructure configuration much faster by looking at the code that has been cleaned up.

- Speed up deployment
When you need to configure the infrastructure for a new service, you can quickly configure it using existing code.<br>
Since multiple resources can be created at the same time, it is much faster than manually creating them in the console.<br>
When deployment is to proceed in the order of development -> stage -> operation, you can configure the same settings without error.



## Infrastructure example

### Initialize




[Top](#Infrastructure-as-code)


### EC2 Instance

- This is simple test server with basic setting

1. VPC
2. Internet Gateway
3. Custom Route Table
4. Subnet
5. Subnet with Route Table
6. Security Group managing
7. Network interface with an ip
8. Assign an elastic IP
9. Create server and command

[Top](#Infrastructure-as-code)


### S3 Bucket





[Top](#Infrastructure-as-code)
