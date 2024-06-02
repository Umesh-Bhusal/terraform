resource aws_instance "terraform"{
    ami = "ami-04b70fa74e45c3917"
    instance_type = "t2.micro"

    user_data = <<-EOF
#!/bin/bash
echo "Hello, World" > index.html
nohup busybox httpd -f -p 8080 &
EOF
user_data_replace_on_change = true

tags = {
    Name = "terraform-example"
}
}