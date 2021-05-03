# VPC

## What is VPC

- Basic network resources that must be built before creating other resources
- When applying a VPC, Network A and Network B are actually on the same network, but they behave as if they are logically different networks
- Networks can be configured for each VPC, and network settings can be set differently for each VPC
- In addition, each VPC will act like a completely independent network

## Create each VPC

- Terraform recommend that you set up your VPC configuration before creating other AWS resources
- Here we gonna create develpoment and production vpc


### Dev VPC 

- Create a security group to be used in common in the VPC
- We are going to create a Security Group for SSH access from office/home and a Security Group of Bastion Server to access instances in the Private Subnet
- Security Group ID needs to be subtracted from Output as it is needed to create other resources in the future
- If there is a security group that you need in common, you can create an additional security group


1. Create Security group

- Default/Home Security Group
  - `04-vpc/dev_eucentral1/default_sg.tf`
  - 10.0.0.0/8 is the CIDR range we are going to use for all VPC setting
  - Default SG : This is a security group that instances should have in common
  - Home SG : This is a security group designed to allow only company access to websites that require access control, such as the Admin page and kibana page

- Bastion Security Group(Optional)
  - `04-vpc/dev_eucentral1/bastion_sg.tf`
  - Bastion SG: This is a security group to use for Bastion server
  - Bastion Aware SG: This is a security group that allows permission to access through Bastion. This security group will be attached to the private instance

> If you are accessing SSH through AWS Session Manager, Teleport, etc. without a bastion server, you do not need to create the following security group

2. Route53 Record

- `04-vpc/dev_eucentral1/route53.tf`
- Create an Internal DNS Record for use in the VPC. It is recommended to create each VPC in order to use DNS for internal communication
- Because each VPC is independent, duplicate names are okay. In this lab, the internal DNS of all VPCs is unified as account.internal

3. Create VPC pakage

- `04-vpc/dev_eucentral1/vpc.tf`
- The basic configuration required for the VPC is installed as a package
- This file contains the following components
  - VPC
  - Public Subnet / Private Subnet / DB Subnet(private)
  - Elastic IP for NAT
  - Route Table
  - Internet Gateway
  - NAT Gateway

4. Route Table Routes

- `04-vpc/dev_eucentral1/route_table_routes.tf`
- You need to register it in the route table so that you can use the IGW and NAT you created earlier 
- Since we plan to add routes for peering later, the files are separated and managed for convenience

5. Output

- `04-vpc/dev_eucentral1/outputs.tf`
- Resources created in the VPC will be used by other resources in the future
- All values to be used are added as output

6. Create resource

- terraform init
- terraform plan -parallelism=30
- terraform apply -parallelism=30


### Production VPC

1. Production environment can be created by proceeding in the same way as the above file setting

2. You only need to change the values in `backend.tf` and `terraform.tfvars` to suit your production

3. Create resource


### Communicate between the VPCs

- Peering is required for internal communication between VPCs
- However, it is important to note that the CIDRs of the two VPCs peering must not overlap
- Transit Gateway is also useful recently, but in this lab, we will establish end-to-end VPC Peering
- In order to enter into VPC Peering, the Requester must make a Peering request, and the Acceptor must approve the request
- Afterwards, the peering ID is stored in the destination IP range and route table
  - Requester: vpc-prod VPC
  - Acceptor: vpc-dev VPC

1. Create Requester

- `04-vpc/prod_eucentral1/peering.tf`
- Add variable you need in variables.tf and set values in terraform.tfvars
- Send request through terraform plan and apply

2. Create Acceptor

- `04-vpc/dev_eucentral1/peering.tf`
- Add variable you need in variables.tf and set values in terraform.tfvars
- Accept connection through terraform plan and apply

3. Add Route Rule in Prod

- `04-vpc/prod_eucentral1/route_table_routes.tf`
- Now register in the route table so that requests coming into the VPC CIDR can use peering connection
- Add variable you need in variables.tf and set values in terraform.tfvars
- Create resource through plan/apply

4. Add Route Rule in Dev

- `04-vpc/dev_eucentral1/route_table_routes.tf`
- `NOTE : Route rules in Prod and Dev are NOT same`
- Add variable you need in variables.tf and set values in terraform.tfvars
- Create resource through plan/apply


## VPC Endpoint

- `04-vpc/dev_eucentral1/vpc_endpoints.tf`
- `04-vpc/prod_eucentral1/vpc_endpoints.tf`
- VPC Endpoint is used when you want to communicate internally using the AWS internal network when using other AWS services
- With a VPC Endpoint, communication can be secured from the outside because it does not travel over the Internet, and speed can be improved because it travels through the internal network
- https://docs.aws.amazon.com/en_kr/vpc/latest/userguide/vpc-endpoints.html


1. Gateway type endpoint

- S3 and DynamoDB, which communicate with APIs over the Internet, are gateway-type and endpoints are created
- There is no need to create a separate security group for the gateway type endpoint

2. Interface type Endpoint

- For other services, you can create an endpoint in an interface type
- Interface-type endpoints require a separate security group
- Security group basically allows port 443 inbound

3. Create resource through plan/apply

