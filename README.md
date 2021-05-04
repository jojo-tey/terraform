# Infrastructure as code

![Image](/images/infrastructure-as-code-1.png)


## What is this repo?

> To practice how to manage AWS as code
> This repo is for componentize Terraform to partially use Terraform resources according to the needs

## :memo: Table of Contents

- [Multi account](#Multi-account)
- [What is Infrastructure as Code?](#What-is-Infrastructure-as-Code?)
- [There are three types of Terraform](#There-are-three-types-of-Terraform)
- [Infrastructure example](#Infrastructure-example)
  - [EC2 Tester](https://github.com/jojo-tey/terraform/tree/main/00-ec2-tester)
  - [Initialize](https://github.com/jojo-tey/terraform/tree/main/01-initialize)
  - [IAM](https://github.com/jojo-tey/terraform/tree/main/02-iam)
  - [Global variables](https://github.com/jojo-tey/terraform/tree/main/03-variables)
  - [VPC](https://github.com/jojo-tey/terraform/tree/main/04-vpc)
  - [S3 + Cloud front](https://github.com/jojo-tey/terraform/tree/main/05-s3-cloudfront)
  - [KMS](https://github.com/jojo-tey/terraform/tree/main/06-kms)
  - [Database](https://github.com/jojo-tey/terraform/tree/main/07-database)
  - [Route53](https://github.com/jojo-tey/terraform/tree/main/08-route53)


## Multi account

AWS provides separate spaces individually. So, when configuring your environment, the most complete way to build an independent environment is to use different accounts for different environments. For multiple accounts, AWS provides a variety of functions and services, such as role assignment and AWS organization.
For example, you can configure multiple accounts like this:


- ID <br>
The account the user logs in to to access other environments.
If you log in only with your id account, you can use your role to access other environments.

- Preprod <br>
An account that can carry out various tests such as development/stage/load testing, etc.

- Production <br>
Account on which infrastructure for actual service operation is deployed

- security <br>
An account that can collect and manage only security-related services

- Log archive <br>
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




## There are three types of Terraform

- Local code: The code currently being written/modified by the developer
- AWS Infrastructure: Infrastructure that is actually deployed on AWS
- Saved state in Backend: The most recently deployed Terraform code shape
<br>
Understanding the flow of these three features makes it easy to figure out what tasks each Terraform command is for. The most important thing here is to make sure that the AWS physical infrastructure and the state stored in the backend are 100% consistent. It is important to keep these two 100% identical while operating Terraform, and Terraform provides several commands such as import and state for this purpose.<br>
First, the infrastructure definition starts with the local code. Developers define Terraform code locally and then provision that code into real infrastructure. At this time, the backend is configured to save the latest code, and the flow is as follows.
<br>

- Terraform init
Creates a .tfstate file for saving state in the specified backend. This is where the last applied Terraform history is stored.
When the init operation is completed, a .terraform file containing the contents defined in .tfstate is created in local.
If another developer has already defined the infrastructure in .tfstate, the other developer can sync to the local through the init operation.

- Terraform plan
Predicting what kind of infrastructure the defined code will create is shown. However, even if there is no error in the contents of the plan, an error may occur when it is actually applied.
The Plan command does not change any shape.

- Terraform apply
This is actually the command to deploy the infrastructure. When the apply is complete, the infrastructure is actually created on AWS, and the results are saved in the backend's.
The results are also saved in the local .terraform file.

- Terraform import
This is the operation of moving the resources deployed in the AWS infrastructure to the terraform state.
This serves to save the state information of the resource in the local .terraform. (Never generates code.)

- It is not saved in the backend until Apply.
If you plan after importing, the result is that the resource is deleted or changed because there is no corresponding code locally. You can write code based on this result.

> If you want to apply Terraform with your existing infrastructure deployed on AWS, you need to move all resources to terraform import. If it's cumbersome, you can start over and raise your resources from scratch, but it's risky to take down an infrastructure that actually serves, so make your decision carefully.




[Top](#Infrastructure-as-code)
