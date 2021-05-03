# Initialize

- resource: It means the infrastructure resource to be actually created. ex) aws_security_group, aws_lb, aws_instance
- provider: It means the Infrastructure Provider to be defined as Terraform.
https://www.terraform.io/docs/providers/index.html
- output: After provisioning the infrastructure, the created resource can be extracted as an output part. The part extracted as output can be used later in the remote state.
- backend: This is the part that designates the space to save the terraform state. beNX uses s3 by default.
- module: A part that collects and defines infrastructure codes that can be used in common. The advantage of using a module is that you can easily create the same resource by changing only the variable.
- remote state: If you use remote state, you can use things that are commonly used by multiple services, such as VPC and IAM. If you specify the backend information in which the tfstate file is stored, terraform fetches the output information from the backend.


## S3 bucket as backend

- Create an S3 bucket to store Terraform's state.
- Collaboration is possible because you can keep up to date with your S3 bucket.

## DynamoDB Table for Lock

- At the same time, it creates a lock on the operation in DynamoDB to prevent modification of the same file.


## Test Command

- `/03-variables/var_global.tf`

1. Replace values to yours in var_global.tf 

  - /01-initialize/account-id

2. terraform init
3. terraform plan -parallelism=30
4. terraform apply -parallelism=30


## Set multi account

The same procedure above should be applied to other accounts. The account resource creation information is stored in buckets within the account.

- `/01-initialize/account-prod`

1. Create an IAM initialization user for the account to be used.
2. repeat `Test Command` section with new account ID
3. terraform init
4. terraform plan -parallelism=30
5. terraform apply -parallelism=30

>Initialization IAM users will also need it when setting up IAM. You can delete it after the task is finished.

