locals {
  env = "dev"
}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "d2a4u"

    workspaces {
      name = "niw-infra"
    }
  }

  required_providers {
    mycloud = {
      source  = "hashicorp/aws"
      version = "~> 5.20"
    }
  }
}

module "network" {
  source = "../../modules/network"
  tags   = {
    repo = "niw-infra"
  }
}
