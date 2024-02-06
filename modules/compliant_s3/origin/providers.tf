terraform {
  required_version = "~> 1.7.2"

  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 5.0"
      configuration_aliases = [aws.origin]

    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.0"
    }
  }
}