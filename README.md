# Network Toolkit

## Installation

#### Cloudformation bootstrap
Use cloudformation to create the initial s3 bucket and DynamoDB table that terraform needs to track state.

```shell
# create the stack
aws cloudformation create-stack --stack-name network-toolkit --template-body file://cloudformation.yaml

# check status of the stack
aws cloudformation describe-stack-events --stack-name [output from above]

# update the stack
aws cloudformation update-stack --stack-name network-toolkit-terraform-bootstrap --template-body file://cloudformation.yaml
```

#### Terraform infrastructure

First initialize Terraform and create the workspaces, which will be used as the `environment`. 

```shell
terraform init
terraform workspace new staging     # staging environment
terraform workspace new production  # production environment
terraform workspace list            # production should be active at this point
terraform plan -out=tfplan
```

To retrieve the sensitive `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` use the terraform console

```shell
terraform console
> aws_iam_access_key.github.id
> nonsensitive(aws_iam_access_key.github.secret)
```