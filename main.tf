resource "aws_instance" "terraform" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data                   = <<-EOF
#!/bin/bash
echo "Hello, World" > index.html
nohup busybox httpd -f -p 8080 &
EOF
  user_data_replace_on_change = true

  tags = {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#  creating security aws_security_group
# resource "aws_security_group" "allow_tls"{
#     name = "allow_tls"
#     description = "allow_tls"

#     dynamic "ingress" {
#         for_each = [22,80,443,3306]
#         iterator = port
# content{
#     description ="Tls from vps"
#     from_port = port.value
#     to_port = port.value
#     protocol = "tcp"
# cidr_blocks=["0.0.0.0/0]  
#   }  
# }
# }