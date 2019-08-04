
resource "aws_instance" "web" {
  count         = 3
  ami           = "${lookup(var.web_ami, var.region)}"
  instance_type = "t2.micro"
  subnet_id     = "${local.public_subnet_ids|count.index}"
  key_name      = "babu"

  tags = {
    Name = "webserver"
  }
}
