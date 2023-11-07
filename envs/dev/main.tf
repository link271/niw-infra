locals {
  env = "dev"
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "niw-testing"

    workspaces {
      name = "niw-infra"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20"
    }
  }
}

module "network" {
  source = "../../modules/network"
  tags = {
    repo = "niw-infra"
  }
}

module "db" {
  source      = "../../modules/db"
  db_password = "niw@123456!#"
  tags = {
    repo = "niw-infra"
  }
  network_vpc_id     = module.network.vpc_id
  network_cidr_block = module.network.cidr_block
}

provider "aws" {
  region = "ap-northeast-1"
}
