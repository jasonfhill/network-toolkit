provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region  = "us-east-1"
  alias   = "us-east-1"
}

provider "aws" {
  region  = "us-west-2"
  alias   = "us-west-2"
}

provider "aws" {
  region  = "eu-west-1"
  alias   = "eu-west-1"
}

terraform {
  required_version = "~> 1.0.11"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.66.0"
    }
  }
  backend "s3" {
    encrypt = true
    bucket = "ntk-terraform"
    dynamodb_table = "ntk-terraform-lock"
    region = "us-east-1"
    key = "backend.tfstate"
    workspace_key_prefix = "ntk-network-toolkit"
  }
}