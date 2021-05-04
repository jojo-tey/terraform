# Database

## Database directory structure

  - The Data connected by Soft Link must be referenced when creating other databases

```
.
└── account-prod
    └── account-prod_eucentral1
        ├── backend.tf
        ├── user
        │   ├── backend.tf
        │   ├── parameter_group.tf
        │   ├── provider.tf -> ../provider.tf
        │   ├── remote_state.tf -> ../remote_state.tf
        │   ├── route53.tf
        │   ├── security_group.tf
        │   ├── terraform.tfvars -> ../terraform.tfvars
        │   ├── var_global.tf -> ../../../../variables/var_global.tf
        │   └── variables.tf -> ../variables.tf
        ├── db_subnet.tf
        ├── provider.tf
        ├── remote_state.tf
        ├── terraform.tfvars
        ├── var_global.tf -> ../../../variables/var_global.tf
        └── variables.tf
```

## RDS

1. Create DB Subnet Group

  - `07-database/rds/account-prod/db_subnet.tf`
  - Create Subnet Group for DB instance only
  - Create a DB subnet using the db private subnet created in the VPC
  - You need to create one for each VPC

2. Create Parameter Group

  - When creating RDS, you can manage database related parameters by utilizing parameter groups
  - If you create a parameter group in advance before creating an actual RDS and then designate the parameter group, you can manage parameter value change information with code
  - `example path : terraform/databases/<Account>/<VPC>/<Service Name>/`

  - Create Remote State
    - `07-database/rds/account-prod/remote_state.tf`
    - RDS is a VPC-dependent service, so you need information about your VPC
    - After attaching the previously set terraform/variables/var_global.tf as Soft Link, the remote_state.tf file is created using the corresponding value
    - Get vpc information from var_global.tf and set it up before
    - You can easily configure remote_state by simply referencing the var_global.tf file as a soft link
    - The Merge function is a function that merges two different Maps into one. Duplicate values are based on the values defined later
  - Create Parameter Group
    - `07-database/rds/account-prod/parameter_group.tf`
    - It is not necessary to set all parameters in the first place
    - Dynamic parameters can be changed while they are live, so parameters that can be changed later can be added later
    - If you change the parameter after the first creation, you can specify the application time through the apply_method variable

3. Create Security Group

  - `07-database/rds/account-prod/security_group.tf`
  - Because DB access control is very important, it is necessary to manage it separately
  - Even with the same ingress port, it is better to separate the ingress blocks for different purposes
  - It is recommended to use a port other than the default database port(3306 -> 3900)

4. Create RDS (Console)

  - `What you must modify`
    1. Define VPC and Subnet group
    2. Define VPC Security group and ports
    3. Define Cluster and Parameter group

5. Create Route53 Record 

  - To make it easier to remember the database endpoint, a separate route53 record is created
  - Use the internal domain so that it is not exposed to the outside

  1. Add the Endpoint to `terraform.tfvars` on the RDS you created earlier
  2. Create a db record through the `07-database/rds/account-prod/route53.tf` file


## Elasticache

1. Create Elasticache Subnet Group

  - `07-database/elasticache/account-prod/elasticache_subnet.tf` 
  - Create Subnet Group for Elasticache service
  - Create a DB subnet using the db private subnet created in the VPC
  - It must be created for each VPC

2. Create Parameter Group

  - `07-database/elasticache/account-prod/remote_state.tf` 
  - `07-database/elasticache/account-prod/parameter_group.tf` 
  - You can manage parameter values to be used in Elasticache instances by using parameter groups
  - RDS is a VPC-dependent service, so you need information about your VPC
  - After attaching the previously set terraform/variables/var_global.tf as Soft Link, the remote_state.tf file is created using the corresponding value
  - Get vpc information from var_global.tf and set it up before
  - You can easily configure remote_state by simply referencing the `var_global.tf` file as a soft link.
  - The Merge function is a function that merges two different Maps into one
  - Duplicate values are based on the values defined later


3. Create Security Group

  - `07-database/elasticache/account-prod/security_group.tf` 
  - It is recommended to manage SG separately for Elasticache access control
  - Even with the same ingress port, it is better to separate the ingress blocks for different purposes
  - It is recommended to use a port other than the default port of the cache engine (6379 -> xxxx)

4. Create Elasticache and Route53 Record

  - `07-database/elasticache/account-prod/elasticache.tf` 
  - It is recommended to use a port other than the engine's default port
  - While creating Elasticache, create Route53 Record at the same time



