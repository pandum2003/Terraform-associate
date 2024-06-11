# Create EC2 Instance
resource "aws_instance" "my-ec2-vm" {
  ami                    = "ami-00beae93a2d981137" # Amazon Linux
  instance_type          = "t2.micro"
  availability_zone =    "us-east-1a"
#  availability_zone =    "us-east-1b"
    tags = {
      "Name" = "web"
    }
/*
  lifecycle {
    prevent_destroy = true # Default is false
  }
*/
}

