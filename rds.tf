resource "aws_security_group" "rds" {
  name        = "rds"
  description = "Allow 8080 and ssh inbound traffic"
  vpc_id      = "vpc-0b9a10415c36fd4f6"

  ingress {
    description     = "ssh from VPC"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["${aws_security_group.pavan.id}"]

  }
}
resource "aws_db_subnet_group" "db-subnetgroup" {
  name = "db-subnetgroup"
  #   subnet_ids = [aws_subnet.datasubnet[0].id, aws_subnet.datasubnet[1].id, aws_subnet.datasubnet[2].id]
  subnet_ids = ["subnet-0b0a9d3f5a452db6a", "subnet-0da34ce8e3cc3c2bc", "subnet-016aa69d24abe81fe"]

  tags = {
    Name = "rdssubnet-group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  name                   = "mydb"
  username               = "sivadev"
  password               = "sriram2662"
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.db-subnetgroup.name
  skip_final_snapshot    = true
  vpc_security_group_ids = ["${aws_security_group.rds.id}"]
  tags = {
    "name" = "stage-rds"
  }
}

