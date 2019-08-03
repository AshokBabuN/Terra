resource "aws_instance" "nat" {
  ami                    = "ami-0d2692b6acea72ee6"
  instance_type          = "t2.micro"
  subnet_id              = "${local.public_subnet_ids[0]}"
  source_dest_check      = false
  vpc_security_group_ids = ["${aws_security_group.nat.id}"]


  tags = {
    Name = "Nat-instance"
  }
}
