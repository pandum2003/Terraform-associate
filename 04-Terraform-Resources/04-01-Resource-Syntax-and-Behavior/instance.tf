# Create EC2 Instance
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_instance" "myinstance" {
    ami = "ami-0d191299f2822b1fa"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
  #  availability_zone = "us-east-1a"

    tags = {
       Name = "JaiGanesh"
#       Name = "OmGanesh"
    }
}
