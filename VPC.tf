# create VPC  subnet 10.0.0.0/16
resource "aws_vpc" "user05_vpc" {
  cidr_block = "10.254.0.0/16"

  tags = {
    Name = "user05_vpc_tag"
  }
}