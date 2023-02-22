resource "aws_security_group" "pavan" {
  name        = "cicd"
  description = "this is using for securitygroup"
  vpc_id      = "vpc-0b9a10415c36fd4f6"

  ingress {
    description = "this is inbound rule"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # security_groups = ["${aws_security_group.pavan-bastion.id}"]
    cidr_blocks = ["103.110.170.85/32"]
  }
  ingress {
    description = "this is inbound rule"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    # security_groups = ["${aws_security_group.siva-alb-sg.id}"]
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "this is inbound rule"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    # security_groups = ["${aws_security_group.siva-alb-sg.id}"]
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "this is inbound rule"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    # security_groups = ["${aws_security_group.siva-alb-sg.id}"]
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "siva"
  }
}
resource "aws_instance" "cicd" {
  ami                    = "ami-0f1a5f5ada0e7da53"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-06137af77745b7160"
  vpc_security_group_ids = [aws_security_group.pavan.id]
  key_name               = "auto"
  # iam_instance_profile = aws_iam_instance_profile.cicd-iam.name
  user_data = <<EOF
             #!/bin/bash
             wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
 rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
 yum update -y
 amazon-linux-extras install java-openjdk11
 yum install jenkins -y
 systemctl start jenkins
 systemctl enable jenkins
       EOF
  tags = {
    Name = "stage-cicd"
  }
}