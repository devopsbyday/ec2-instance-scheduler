
# AWS EC2 Instance Scheduler with Terraform

## Overview
This repository contains Terraform configurations and a Makefile for automating the scheduling of AWS EC2 instances shutdowns. It aims to help in reducing AWS costs by  stopping EC2 instances automatically based on a predefined schedule (currently every 10 minutes and will not reboot, with the Tag: Name, Rowden ).

## Prerequisites
Before you can use this project, ensure you have the following prerequisites installed and configured:
- [Terraform](https://www.terraform.io/downloads.html) (Version 1.2.x or newer)
- AWS CLI, configured with administrator access
- Make (Optional, if you prefer to run Terraform commands directly)

## Configuration
1. **AWS Credentials**: Ensure your AWS credentials are configured. This can be done by running `aws configure` or by setting the appropriate environment variables (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_DEFAULT_REGION`).

## Usage
The repository uses a Makefile to simplify the execution of Terraform commands. The following commands are available:

- **Init**: Initialize Terraform.
  ```
  make init
  ```
- **Plan**: Show what Terraform will do before actually doing it.
  ```
  make plan
  ```
- **Apply**: Apply the changes required to reach the desired state.
  ```
  make apply
  ```
- **Destroy**: Destroy the Terraform-managed infrastructure.
  ```
  make destroy
  ```

Alternatively, if you prefer not to use the Makefile, you can run the Terraform commands directly (`terraform init`, `terraform plan`, etc.).

## Security
Ensure your AWS IAM roles and policies are correctly configured to allow the necessary permissions for EC2, CloudWatch, and Lambda services.

## Contributing
Contributions to this project are welcome! Please submit pull requests or create issues for any enhancements, bug fixes, or feature requests.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
