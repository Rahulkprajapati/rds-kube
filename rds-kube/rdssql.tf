provider "aws" {
  region = "ap-south-1"
  profile = "ansibleuser"
}
resource "aws_security_group" "sg" {
  name        = "mysql-sg"
# Allowing traffic only for MySQL and that too from same VPC only.
  ingress {
    description = "Allow All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
# Allowing all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
    Name = "mysql-sg"
  }
}
resource "aws_db_instance" "mydb" {
  allocated_storage    = 20
  identifier           = "dbinstance"
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7.30"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "rahul"
  password             = "anything123"
  iam_database_authentication_enabled = true
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible = true
  tags = {
    Name = "sqldb"
  }
}