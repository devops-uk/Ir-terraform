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