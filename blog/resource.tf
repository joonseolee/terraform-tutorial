resource "aws_instance" "web" {
  ami = "ami-a1b2c3"
  instance_type = "t2.micro"
}

resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags = {
    Name = "test-vpc"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "Web Public Subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "Database Private Subnet"
  }
}