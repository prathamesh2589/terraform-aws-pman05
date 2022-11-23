resource "aws_ebs_volume" "pman05-data-vol" {
  #count = 1
  availability_zone = aws_instance.pman_user05.availability_zone
  size              = 2
  encrypted = false
  tags = {
    Name = "pman05-data-volume"
  }
}
#
resource "aws_volume_attachment" "pman_user05_att" {
  device_name = "/dev/sdb"
  #volume_id   = [element(aws_ebs_volume.pman05-data-vol.[*].id, count.index)]
  volume_id   = aws_ebs_volume.pman05-data-vol.id
  instance_id = aws_instance.pman_user05.id
  #count = length
}