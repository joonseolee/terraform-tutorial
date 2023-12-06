variable "aws_region" {
  description = "Region for VPC"
  default = "ap-northeast-1"
}

variable "vpc_cidr" {
  description = "CIDR for JOINC"
  default = "10.100.0.0/16"
} 

variable "public_subnet_cidr" {
  description = "CIDR for Joinc public subnet"
  default = "10.100.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for Joinc private subnet"
  default = "10.100.2.0/24"
}

variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-047f7b46bd6dd5d84"
}