#creating the AWS EC2 instance
resource "aws_instance" "pman_user05" {
  #count = 1
  #ami           = var.ec2imageami
  ami = data.aws_ami.pman05_ami.id
  instance_type = "t2.micro"
  #security_groups = [aws_security_group.PGSASS01.name]
  vpc_security_group_ids = [aws_security_group.PGSASS01.id]
  subnet_id              = aws_subnet.user05_subnet1.id
  #subnet_id         = aws_subnet.user05_subnet2.id
  #aws_vpc           = aws_vpc.user05_vpc
  iam_instance_profile = aws_iam_instance_profile.ec2_profile_pman.name
  tags = {
    #"Name" = "pman_EC2_user05_tag ${count.index}"
    "Name" = "pman_EC2_user05_tag"
  }
}