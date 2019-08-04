
#variables for vpc_cidr

variable "vpc_cidr" {
  description = "choose vpc cidr for vpc"
  type        = "string"
  default     = "10.0.0.0/16"
}

#variables for vpc_teneny

variable "vpc_tenancy" {
  type        = "string"
  description = "choose tenancy for vpc"
  default     = "default"
}

#variable for vpc tags

variable "vpc_tags" {
  type = "map"
  default = {
    Name  = "MyVPC"
    Batch = "7am"

  }
}
#varibles for public subnets tags

variable "Public_sub_tags" {
  type = "map"
  default = {
    Name = "Public_subnet"
  }
}

#variable for private subnet

variable "private_sub_tags" {
  type = "map"
  default = {
    Name = "private_subnet"
  }
}

#variable for public subnet_cidrs

variable "public_subnet_cidrs" {
  description = "choose  cidr for public subnet"
  type        = "list"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

#variable  for private subnet
variable "private_subnet_cidrs" {
  description = "choose  cidr for private subnet"
  type        = "list"
  default     = ["10.0.6.0/24", "10.0.7.0/24"]
}

variable "region" {
  default = "ap-south-1"
}

#variable for nat_instance amis
variable "nat_amis" {
  type = "map"
  default = {
    ap-south-1 = "ami-0d2692b6acea72ee6"
  }
}

#variables for Ec2_instances amis
variable "web_ami" {
  type = "map"
  default = {
    ap-south-1 = "ami-0d2692b6acea72ee6"
  }
}
