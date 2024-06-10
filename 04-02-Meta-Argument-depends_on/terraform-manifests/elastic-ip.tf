resource "aws_eip" "lb" {
  instance = aws_instance.my-ec2-vm.id
  domain   = "vpc"
  depends_on = [aws_internet_gateway.dev-igw]
}