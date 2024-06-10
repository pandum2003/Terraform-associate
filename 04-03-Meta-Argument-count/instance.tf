# Resource-8: Create EC2 Instance
resource "aws_instance" "my-ec2-vm" {
  ami                    = "ami-00beae93a2d981137" # Amazon Linux
  instance_type          = "t2.micro"
  count = 5
    tags = {
  #  "Name" = "web"
    "Name" = "web-${count.index}"
  }
}



