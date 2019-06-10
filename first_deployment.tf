provider "aws" {
  access_key = "AKIAYMRUE3MNQNIT23ST"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_vpc" "web" {
  cidr_block = "198.168.0.0/16"
  instance_tenancy = "default"
  tags = {
   Name = "first VPC"
   location = " warangal"
  }
}

resource "aws_subnet" "subnetwork1"{
  vpc_id     = "${aws_vpc.web.id}"
  cidr_block = "198.168.0.0/16"

  tags = {
    Name = "subnetwork1"
  }

}
resource "aws_docdb_cluster" "proj_devops" {
  cluster_identifier      = "my-docdb-cluster"
  engine                  = "docdb"
  master_username         = "Irfan"
  master_password         = "infection"
  #backup_retention_period = 5
  #preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
}
resource "aws_dynamodb_table" "table1" {
  name = "table1"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key  = "UserId"
  attribute {
    name = "UserId"
    type = "S"
  }
}
resource "aws_db_instance" "base1" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mine"
  username             = "foo"
  password             = "foo123456"
  parameter_group_name = "default.mysql5.7"
}
