resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "My_subnet1" {
  vpc_id            = "${aws_vpc.my_vpc.id}"
  availability_zone = "${var.az-1}"
  cidr_block        = "${local.subnet1}"
}
resource "aws_subnet" "My_subnet2" {
  vpc_id            = "${aws_vpc.my_vpc.id}"
  availability_zone = "${var.az-2}"
  cidr_block        = "${local.subnet2}"
}
resource "aws_subnet" "My_subnet3" {
  vpc_id            = "${aws_vpc.my_vpc.id}"
  availability_zone = "${var.az-3}"
  cidr_block        = "${local.subnet3}"
}



resource "aws_security_group" "allow_nfs" {
  name = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id = "${aws_vpc.my_vpc.id}"


  ingress {
    description = "NFS Port allow"
    from_port   = "${var.port}"
    to_port     = "${var.port}"
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
    Name = "allow_nfs"
  }
}
