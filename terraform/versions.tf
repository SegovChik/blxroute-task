terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.41.0"
    }
    ec = {
      source  = "elastic/ec"
      version = "0.5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
