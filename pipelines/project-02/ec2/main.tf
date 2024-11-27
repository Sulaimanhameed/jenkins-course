terraform {
  backend "s3" {}
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-055e3d4f0bbeb5878"
  instance_type = "t2.micro"
  monitoring    = true

  tags = {
    Name = "EC2Instance"
  }

  key_name = "sulaiman"
  vpc_security_group_ids = ["sg-0d5b17c6e9222e9be"]

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }
}
