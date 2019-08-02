resource "aws_instance" "nat" {
  ami           = "ami-0d2692b6acea72ee6"
  instance_type = "t2.micro"

  tags = {
    Name = "Nat-instance"
  }
}
