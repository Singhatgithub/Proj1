# Proj1 - Terraform AWS Infrastructure

This Terraform project sets up AWS infrastructure components for a web server deployment, including backend storage, state locking, and an EC2 instance with a security group configured for web traffic and database access.

## Project Structure

- **dynamodb/**: Contains Terraform configuration for a DynamoDB table used for Terraform state locking.
- **s3/**: Contains Terraform configuration for an S3 bucket used as the Terraform backend.
- **module/**: Main infrastructure module that deploys an EC2 instance with a security group using a nested webserver module. Includes backend configuration.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) version 1.14.3 or later
- AWS account with appropriate permissions (EC2, S3, DynamoDB)
- AWS CLI configured with access keys (or set via environment variables)
- SSH key pair generated (public key file `id_rsa.pub` in `module/` directory)

## Setup

1. Clone or navigate to the project directory.

2. Set up AWS credentials:
   - Either configure AWS CLI: `aws configure`
   - set environment variables: `AWS_ACCESS_KEY_ID` , `AWS_SECRET_ACCESS_KEY` , 'subnet_id' and 'image_id'

3. Initialize the backend (S3 and DynamoDB):
   - Navigate to `s3/` directory: `cd s3`
   - Run `terraform init`
   - Run `terraform apply` to create the S3 bucket

   - Navigate to `dynamodb/` directory: `cd ../dynamodb`
   - Run `terraform init`
   - Run `terraform apply` to create the DynamoDB table

## Deployment

1. Navigate to the `module/` directory: `cd module`

2. Update `terraform.tfvars` with your specific values:
   - `access_key`: Your AWS access key
   - `secret_key`: Your AWS secret key
   - `ports`: ports like 22, 80, 443 etc for security group

3. Initialize Terraform: `terraform init`

4. Review the plan: `terraform plan`

5. Apply the changes: `terraform apply`

## Variables

The following variables need to be set (in `terraform.tfvars` or via command line):

- `access_key`: AWS access key
- `secret_key`: AWS secret key
- `instance_type`: EC2 instance type (default: t2.micro)
- `image_id`: AMI ID for the EC2 instance
- `key_name`: Name for the SSH key pair (default: mykey)
- `subnet_id`: Subnet ID where the instance will be deployed
- `ports`: List of ports to open in the security group (default: [22, 80, 443, 3306, 27017] for SSH, HTTP, HTTPS, MySQL, MongoDB)

## Outputs

- `mypublicIP`: Public IP address of the deployed EC2 instance

## Modules

- **webserver**: A reusable module for deploying EC2 instances with key pairs and security groups.

## Security Notes

- The security group allows inbound traffic on specified ports from all IP addresses (0.0.0.0/0). For production, restrict to specific IP ranges.
- AWS credentials are passed via variables. Avoid hardcoding them in code.
- Ensure the S3 bucket name is unique across AWS.

## Cleanup

To destroy the infrastructure:

1. In `module/` directory: `terraform destroy`
2. In `dynamodb/` directory: `terraform destroy`
3. In `s3/` directory: `terraform destroy`

## Contributing

Please follow standard Terraform best practices and validate changes with `terraform validate` and `terraform plan`.
