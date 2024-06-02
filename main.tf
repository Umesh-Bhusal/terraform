resource aws_instance "terraform"{
    ami = "ami-0705384c0b33c194c"
    instance_type = "t2.micro"

tags{
    Name= terraform-example
}
}