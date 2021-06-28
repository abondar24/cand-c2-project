# TODO: Designate a cloud provider, region, and credentials

provider "aws" {
  access_key = "key"
  secret_key = "key"
  region = "eu-west-1"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2

variable "t2_count" {
  default = "4"
}

resource "aws_instance" "Udacity_T2" {
  ami = "ami-0ea3405d2d2522162"
  instance_type = "t2.micro"
  subnet_id = "subnet-e69cf3bc"
  count = "${var.t2_count}"
  tags = {
   Name = "MICRO-${count.index + 1}"
  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4

variable "m4_count" {
  default = "2"
}

resource "aws_instance" "Udacity_M4" {
  ami = "ami-0ea3405d2d2522162"
  instance_type = "m4.large"
  subnet_id = "subnet-e69cf3bc"
  count = "${var.m4_count}"
  tags = {
   Name = "LARGE-${count.index + 1}"
  }
}
