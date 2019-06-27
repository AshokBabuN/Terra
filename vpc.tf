

locals {
  azs = "${data.aws_availability_zones.azs.names}"
}
resource "aws_vpc" "myapp_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.vpc_tenancy}"
  tags             = "${var.vpc_tags}"
}
#create public subnet
resource "aws_subnet" "main" {
  count             = "${length(local.azs)}"
  vpc_id            = "${aws_vpc.myapp_vpc.id}"
  cidr_block        = "${element(var.subnet_cidrs, count.index)}"
  availability_zone = "${element(local.azs, count.index)}"
  tags              = "${var.Public_sub_tags}"

}
