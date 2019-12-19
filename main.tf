provider "aws" {
    region = "eu-west-1"
    access_key = ""
    secret_key = ""
}
resource "aws_instance" "ec2" { # I called name "ec2", you can change your own name
  ami = "ami-0dad20bd1b9c8c004" # Image: Ubuntu Server 18.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.micro" # VM Spec
  security_groups = ["${aws_security_group.allow_ssh.name}"]
  key_name = "aws-anthony"
}


resource "aws_security_group" "allow_ssh" {
  name        = "allow ssh"
  description = "only ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

