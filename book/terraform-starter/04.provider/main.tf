terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "> 4.0"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region = "ap-northeast-2"
  access_key = ""
  secret_key = ""
  token = ""
}

data "aws_ami" "amzn2" {
    most_recent = true
    owners = [ "amazon" ]

    filter {
      name = "owner-alias"
      values = [ "amazon" ]
    }

    filter {
      name = "name"
      values = [ "amzn2-ami-hvm*" ]
    }
}

resource "aws_instance" "app_server" {
  ami = data.aws_ami.amzn2.id
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}