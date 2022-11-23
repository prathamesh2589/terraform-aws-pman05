data "aws_ami" "pman05_ami" {
  #executable_users = ["amazon"]
  most_recent      = true
  #name_regex       = "^myami-\\d{3}"
  #owners           = [""]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

/*
ami-08e167817c87ed7fd (64-bit (x86))

data "aws_ip_ranges" "european_ec2" {
  regions  = ["eu-west-1", "eu-central-1"]
  services = ["ec2"]
}

resource "aws_security_group" "from_europe" {
  name = "from_europe"

  ingress {
    from_port        = "443"
    to_port          = "443"
    protocol         = "tcp"
    cidr_blocks      = data.aws_ip_ranges.european_ec2.cidr_blocks
    ipv6_cidr_blocks = data.aws_ip_ranges.european_ec2.ipv6_cidr_blocks
  }

  tags = {
    CreateDate = data.aws_ip_ranges.european_ec2.create_date
    SyncToken  = data.aws_ip_ranges.european_ec2.sync_token
  }
}*/