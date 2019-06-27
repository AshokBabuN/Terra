
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
#varibles for subnets tags

variable "Public_sub_tags" {
  type = "map"
  default = {
    Name = "Public_subnet"
  }
}

#variable for subnet_cidrs

variable "subnet_cidrs" {
  description = "choose  cidr for public subnet"
  type        = "list"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
