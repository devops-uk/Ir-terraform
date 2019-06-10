provider "aws" {
  access_key = "AKIAXMRC7LP6GIBBMB7P"
  secret_key = "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"
  region     = "us-east-1"
}

/*resource "aws_vpc" "web" {
  cidr_block = "198.168.0.0/16"
  instance_tenancy = "default"
  tags = {
   Name = "first VPC"
   location = " warangal"
  }
}

.assign_generated_ipv6_cidr_block

resource "aws_subnet" "subnetwork1"{
  vpc_id     = "${aws_vpc.web.id}"
  cidr_block = "198.168.0.0/16"

  tags = {
    Name = "subnetwork1"
  }

}
resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "mydoc2"
  engine                  = "docdb"
  master_username         = "foo"
  master_password         = "mustbeeightchars"
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
}*/
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

resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "mydoc2"
  engine                  = "docdb"
  master_username         = "foo"
  master_password         = "mustbeeightchars"
  #backup_retention_period = 5
  #preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
  snapshot_identifier = "my-docdb-cluster-final-snapshot"
}
