provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name  = "Firstvpc"
    Batch = "7am"

  }
}

resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
