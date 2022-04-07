resource "aws_db_instance" "default" {
  allocated_storage    = 20
  identifier           = "testinstance"
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.m4.large"
  name                 = "test"
  username             = "admin"
  password             = "sdmin423454132"
  parameter_group_name = "default.mysql5.7"
}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "private-subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
#  availability_zone = "AZ-a of the Region"
}
resource "aws_subnet" "private-subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
#  availability_zone = "AZ-b of the region"
}
resource "aws_db_subnet_group" "db-subnet" {
  name       = "db_subnet_group"
  subnet_ids = ["${aws_subnet.private-subnet1.id}", "${aws_subnet.private-subnet2.id}"]
}
