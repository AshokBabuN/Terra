resource "aws_instance" "nat" {
  ami               = "ami-0d2692b6acea72ee6"
  instance_type     = "t2.micro"
  subnet_id         = "${local.public_subnet_ids[0]}"
  source_dest_check = false


  tags = {
    Name = "Nat-instance"
  }
}
