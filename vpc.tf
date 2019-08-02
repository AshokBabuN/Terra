
#for local variables

locals {
  azs = "${data.aws_availability_zones.azs.names}"
}

#create a vpc

resource "aws_vpc" "myapp_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.vpc_tenancy}"
  tags             = "${var.vpc_tags}"
}
#create public subnet
resource "aws_subnet" "main" {
  count                   = "${length(local.azs)}"
  vpc_id                  = "${aws_vpc.myapp_vpc.id}"
  cidr_block              = "${element(var.public_subnet_cidrs, count.index)}"
  availability_zone       = "${element(local.azs, count.index)}"
  map_public_ip_on_launch = true
  tags                    = "${var.Public_sub_tags}"

}


#create internet gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.myapp_vpc.id}"

  tags = {
    Name = "Public_ing"
  }
}

#create custom public route table for internet gateway
resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.myapp_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "public_rt"
  }
}

#associat public subnet with public route table

resource "aws_route_table_association" "a" {
  count          = "${length(local.azs)}"
  subnet_id      = "${element(aws_subnet.main.*.id, count.index)}"
  route_table_id = "${aws_route_table.r.id}"
}



#create private1 subnet
resource "aws_subnet" "private" {
  count             = "2"
  vpc_id            = "${aws_vpc.myapp_vpc.id}"
  cidr_block        = "${element(var.private_subnet_cidrs, count.index)}"
  availability_zone = "${element(local.azs, count.index)}"
  tags              = "${var.private_sub_tags}"

}

#create custom private route table for internet gateway
resource "aws_route_table" "prt" {
  vpc_id = "${aws_vpc.myapp_vpc.id}"

  tags = {
    Name = "private_rt"
  }
}

#associate private subnet with private route table
resource "aws_route_table_association" "pa" {
  count          = "2"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${aws_route_table.prt.id}"
}
