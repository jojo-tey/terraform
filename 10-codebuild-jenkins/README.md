# Jenkins + Code build

A structure that deploys Jenkins to an EC2 instance and deploys it by linking with AWS Codebuild



1. Create an instance through Application Load Balancer + Autoscaling Group.
2. Userdata is added through terraform template file.
3. Since the data files created in Jenkins contain a lot of important information that should not be lost, create an Amazon EFS and mount it in the /var/lib/jenkins Directory.



## Important point for deploy with Jenkins

  - `Elastic File System`
  - `User data`

1. Create Elastic File System
  - Create an Elastic file system with Terraform
  - The domain name of the created EFS is referenced in Userdata of Instance

2. Define User Data
  - `10-codebuild-jenkins/_module/jenkins/scripts/userdata.sh.tpl`
  - Use Terraform's template_file to refer to the efs domain name in Userdata

  - `10-codebuild-jenkins/_module/jenkins/template.tf`
  - The user_data file is referred to in the form of template_file and it passes EFS dns_name as a variable

## Using Module

  - The entire Jenkins set is defined through a module, and actual variables are set differently depending on the environment.
  - You can create the same set of jenkins by copying the whole `terraform/platform/jenkins/<environment>` directory and defining a new environment variable.
  - Please change jenkins_master_ami to the AMI ID of the region in the terraform.tfvars file. (Amazon Linux 2)
  - For the external LB, be sure to open only `the internal network for security!!!`
  - When using Github webhook, it is recommended not to open it publicly, but to open only hook server IPs from the https://api.github.com/meta site.
  - In addition, even if you send a webhook, do not send it to jenkins immediately, but go through the authentication process with API Gateway + Lambda in the middle.

## Link to Codebuild

  - When Jenkins and Codebuild are linked, the build or deployment job is created in jenkins, and the actual work can be performed through Codebuild. - When a job is executed in Jenkins, an independent codebuild job is created on AWS.
  - Advantages
    - Each job can be built/distributed in an independent environment.
    - Due to the nature of AWS Codebuild, it can be executed within a specific VPC, so it is easy to control access or link with other services.
    - You can view all the logs of Codebuild through Amazon CloudWatch Logs, and you can easily find the history of existing builds and deployments.

### What to prepare

  1. `Github token` for link to Jenkins and Codebuild
    - `On Github` : Settings -> Developer settings -> Personal access tokens -> Generate new token
    - Put name and add `repo`, `read:org` permission
  2. `AWS IAM User` and `Credentials` to use for jenkins
    - Find and enter the IAM directory of the account where you want to deploy Jenkins
    - Permissions for GetLogEvents and Codebuild:* are mandatory. Other privileges can be added/deleted as needed.
    - Example code : `10-codebuild-jenkins/_module/codebuild/iam_jekins.tf`
  3. `AWS_ACCESS_KEY_ID`
  4. `AWS_SECRET_ACCESS_KEY`

### Create Codebuild

  - Required resource
    - IAM role for Codebuild
    - Docker image that is the basic base of Codebuild
    - Security group to use in Codebuild
    - Codebuild project

  1. Create IAM role
    - This is the role you will use in Codebuild, so you must have the necessary permissions for the actual build/deployment.
    - Go to the IAM directory of the account where you want to create the codebuild and proceed with the creation. (`10-codebuild-jenkins/_module/codebuild/iam_codebuild.tf`)

  2. Create Docker Image(optional)

  

