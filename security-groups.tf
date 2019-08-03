resource "aws_security_group" "nat" {
  name        = "nat_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${aws_vpc.myapp_vpc.id}"

  ingress {
    #this allows all traffic from out side
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}
