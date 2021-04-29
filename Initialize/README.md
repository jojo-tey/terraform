# Initialize

- resource: It means the infrastructure resource to be actually created. ex) aws_security_group, aws_lb, aws_instance
- provider: It means the Infrastructure Provider to be defined as Terraform.
https://www.terraform.io/docs/providers/index.html
- output: After provisioning the infrastructure, the created resource can be extracted as an output part. The part extracted as output can be used later in the remote state.
- backend: This is the part that designates the space to save the terraform state. beNX uses s3 by default.
- module: A part that collects and defines infrastructure codes that can be used in common. The advantage of using a module is that you can easily create the same resource by changing only the variable.
- remote state: If you use remote state, you can use things that are commonly used by multiple services, such as VPC and IAM. If you specify the backend information in which the tfstate file is stored, terraform fetches the output information from the backend.


## There are three types of Terraform.

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