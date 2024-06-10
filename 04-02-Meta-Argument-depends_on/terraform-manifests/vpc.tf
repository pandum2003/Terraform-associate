# Resources Block
# Resource-1: Create VPC
resource "aws_vpc" "dev-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dev-myvpc"
  }
}
# Resource-2: Create Subnets
resource "aws_subnet" "dev-vpc-subnet" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "dev-subnet"
  }
}
# Resource-3: Internet Gateway
resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev-vpc.id
  tags = {
    Name = "dev-igw"
  }
}
# Resource-4: Create Route Table
resource "aws_route_table" "dev-rt" {
  vpc_id = aws_vpc.dev-vpc.id
  tags = {
    Name = "dev-route-table"
  }
}

# Resource-5: Create Route in Route Table for Internet Access
resource "aws_route" "dev-rt" {
  route_table_id         = aws_route_table.dev-rt.id
  gateway_id             = aws_internet_gateway.dev-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

# Resource-6: Associate the Route Table with the Subnet
resource "aws_route_table_association" "dev-aws_route_table_association" {
  subnet_id      = aws_subnet.dev-vpc-subnet.id
  route_table_id = aws_route_table.dev-rt.id
}
# Resource-7: Create Security Group
resource "aws_security_group" "dev-sg" {
  vpc_id      = aws_vpc.dev-vpc.id
  name        = "webserver"
  description = "Allow HTTP from Anywhere"
  # Allow http 80 port
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #Allow ssh port 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "dev-sg"
  }
}
