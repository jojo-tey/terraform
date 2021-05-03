# EC2 Tester

- This is pre-deploy test server with basic setting
- It will create following objects

1. VPC
2. Internet Gateway
3. Custom Route Table
4. Subnet
5. Subnet with Route Table
6. Security Group managing
7. Network interface with an ip
8. Assign an elastic IP
9. Create server and command


## Server launch

1. Create terraform.tfvars in workdir
2. `Add *.tfvars in gitignore`

- terraform.tfvars

3. Replace value with your keys

```
AWS_ACCESS_KEY = "Your Key"

AWS_SECRET_KEY = "Your Key"

AWS_REGION = "Your Region"

# SEVER OS AMI KEY
AMIS = "Your AMI"

```

> `variable.tf` and `terraform.tfvars` are functioning like key and value. This is one of the way to manage secret values


- init.tf 

4. terraform init
5. Customize values as you need
6. terraform plan
7. terraform apply