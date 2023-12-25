provider "aws" {
  region     = "us-west-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token      = var.aws_token
}

provider "aws" {
  alias      = "seoul"
  region     = "ap-northeast-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token      = var.aws_token
}

module "ec2_california" {
  source = "../modules/terraform-aws-ec2"
}

module "ec2_seoul" {
  source = "../modules/terraform-aws-ec2"
  providers = {
    aws = aws.seoul
  }
  instance_type = "m5.large"
}