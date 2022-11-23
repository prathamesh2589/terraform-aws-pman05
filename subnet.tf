#creating subnet1 10.0.5.0/24
resource "aws_subnet" "user05_subnet1" {
  vpc_id     = aws_vpc.user05_vpc.id
  cidr_block = "10.254.5.0/24"
  #availability_zone = "us-east-1"

  tags = {
    Name = "user05_subnet1_tag"
  }
}

#creating subnet2 10.0.6.0/24
resource "aws_subnet" "user05_subnet2" {
  vpc_id     = aws_vpc.user05_vpc.id
  cidr_block = "10.254.6.0/24"
  #availability_zone = "us-east-1"

  tags = {
    Name = "user05_subnet2_tag"
  }
}