# Elastic Load Balancer

Load Balancer is an essential resource to distribute traffic across multiple instances. Most services on EC2 usually have LB at the front, but LB has a lot to set up, so it can be conveniently created/managed by organizing it with code once.

## Load Balancer

  - Target Group
    - https(443) : redirect to instance
    - http(80) : redirect to 443
  - Route53 Record
    - A record for ELB


## Module

Usually, resources for services are often created identically for each environment. Therefore, the same code is created using a module so that only variables can be used.

  - outputs.tf : Output within the module.
  - service.tf : File containing all resource generation code
  - var_lb.tf : Load Balancer related variable definition file
  - var_sg.tf : Security Group related variable definition file
  - variables.tf : Other variable definition files

```
.
└── hello
    ├── outputs.tf
    ├── service.tf
    ├── var_lb.tf
    ├── var_sg.tf
    └── variables.tf 
```

## Environment division

Create a folder for each environment in the same path as the _module folder. Below is an example for dev and prod. As you can see if you look closely, the file structure within each environment is exactly the same. `However, the variable values are of course different.` With this configuration, you can easily create resources with the same configuration if you need a new environment.


```
.
├── _module
│   └── hello
│       ├── outputs.tf
│       ├── service.tf
│       ├── var_lb.tf
│       ├── var_sg.tf
│       └── variables.tf
├── account-dev
│   ├── backend.tf
│   ├── output.tf -> ../output.tf
│   ├── provider.tf -> ../provider.tf
│   ├── remote_state.tf
│   ├── service.tf
│   ├── terraform.tfvars
│   ├── var_global.tf -> ../../../variables/var_global.tf
│   ├── var_lb.tf -> ../variables/var_lb.tf
│   ├── var_route53.tf -> ../../../variables/var_route53.tf
│   ├── var_sg.tf -> ../variables/var_sg.tf
│   └── variables.tf -> ../variables.tf
├── account-prod
│   ├── backend.tf
│   ├── output.tf -> ../output.tf
│   ├── provider.tf -> ../provider.tf
│   ├── remote_state.tf
│   ├── service.tf
│   ├── terraform.tfvars
│   ├── var_global.tf -> ../../../variables/var_global.tf
│   ├── var_lb.tf -> ../variables/var_lb.tf
│   ├── var_route53.tf -> ../../../variables/var_route53.tf
│   ├── var_sg.tf -> ../variables/var_sg.tf
│   └── variables.tf -> ../variables.tf
├── output.tf
├── provider.tf
├── variables
│   ├── var_lb.tf
│   └── var_sg.tf
└── variables.tf
```

> After creation is complete, Autoscaling need to be attached to the target group

