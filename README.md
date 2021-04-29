# Infrastructure_as_code

> To practice how to manage AWS as code

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





