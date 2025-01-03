Terraform Project: Deploy Infrastructure with VPC, Subnets, Load Balancer, Internet Gateway, and EC2 Instances
-------------------------------------

This project demonstrates how to provision a complete AWS infrastructure using Terraform. The setup includes a Virtual Private Cloud (VPC), public subnets, an Internet Gateway, a Load Balancer, and EC2 instances.

Architecture Overview
-----------------------------------
The architecture includes:

VPC: A dedicated network for your infrastructure.

Subnets: Public and private subnets distributed across availability zones.

Internet Gateway: Enables internet access for resources in public subnets.

Load Balancer: Distributes traffic across EC2 instances.

EC2 Instances: Compute resources for your application.

Prerequisites:
--------------------------------------------
Terraform Installed: Download Terraform.

AWS CLI Installed: Install AWS CLI.

AWS Access Credentials: Configure credentials with the AWS CLI:

bash:
---------------------------------------------
Copy code
aws configure
SSH Key Pair: Create an AWS key pair or use an existing one.

Steps to Implement:
-------------------------------------------------------

1. Clone the Repository :
-------------------------------------------
bash:
Copy code
git clone <repository-url>
cd <repository-directory>

3. Initialize Terraform:
Run the following command to download the required provider plugins:
bash:
Copy code
terraform init

4. Review the Plan
Check the infrastructure plan:
bash:
Copy code
terraform plan

6. Apply the Configuration
Provision the infrastructure:
bash:
Copy code
terraform apply
Confirm with yes when prompted.

Terraform Resources Created:
-------------------------------------------------
VPC: A custom VPC with the specified CIDR block.
Subnets:
Public subnets for internet-facing resources.

Private subnets for backend resources.

Internet Gateway: Provides internet access to public subnets.

Route Tables: Routes traffic appropriately for public and private subnets.

Elastic Load Balancer (ALB): Distributes incoming traffic to backend EC2 instances.

Security Groups: Controls traffic for EC2 instances and the Load Balancer.

EC2 Instances: Application servers launched in private subnets.

Contributing:
----------------------------------------------------
Contributions are welcome! Feel free to submit a pull request or open an issue.
