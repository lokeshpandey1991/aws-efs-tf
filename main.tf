resource "aws_efs_file_system" "my_efs" {
  creation_token = "efs"
  performance_mode = "generalPurpose"
  throughput_mode = "bursting"
  encrypted = "false"
  tags = {
    Name = "myefs"
  }
}

resource "aws_efs_mount_target" "mymount1" {
  file_system_id = "${aws_efs_file_system.my_efs.id}"
  subnet_id      = "${aws_subnet.My_subnet1.id}"
  security_groups = ["${aws_security_group.allow_nfs.id}"]


}
resource "aws_efs_mount_target" "mymount2" {
  file_system_id = "${aws_efs_file_system.my_efs.id}"
  subnet_id      = "${aws_subnet.My_subnet2.id}"
  security_groups = ["${aws_security_group.allow_nfs.id}"]


}
resource "aws_efs_mount_target" "mymount3" {
  file_system_id = "${aws_efs_file_system.my_efs.id}"
  subnet_id      = "${aws_subnet.My_subnet3.id}"
  security_groups = ["${aws_security_group.allow_nfs.id}"]

}
