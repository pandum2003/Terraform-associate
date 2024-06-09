# Resource Block to Create VPC in us-west-1 which uses default provider
resource "aws_vpc" "us-west-1" {
    cidr_block = "10.1.0.0/16"
    provider = aws.us-west-1
    tags = {
        "Name" = "us-west-1"
    }
}