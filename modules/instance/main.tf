data "aws_ami" "linux-ami" {
  most_recent = true

  filter {
        name = "image-id"
        values = [var.image_name]
    }


  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_security_group" "security_group" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.existing_vpc.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "web"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "terraform-sg"
  }
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "server-key"
  public_key = var.public_key
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.linux-ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.security_group.id]
  subnet_id = data.aws_subnet.existing_subnet.id
  associate_public_ip_address = true
  key_name = aws_key_pair.ssh-key.key_name

  user_data = file("entry-script.sh")

  tags = {
    Name = "terraform-server"
  }
}

