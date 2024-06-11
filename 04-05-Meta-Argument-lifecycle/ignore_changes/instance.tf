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
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      tags,
    ]
  }*/
}

