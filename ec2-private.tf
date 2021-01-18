resource "aws_instance" "private"{
    count = length(aws_subnet.privateSubnets)
    subnet_id = aws_subnet.privateSubnets[count.index].id 
    ami = "ami-0db0b3ab7df22e366"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.private-sg.id]
    key_name = "ansible"
    iam_instance_profile = aws_iam_instance_profile.ec2_profile.id
    root_block_device{
        volume_size = "10"
        volume_type = "gp2"
        delete_on_termination = "true"
    }
    tags={
        Name = "private-${count.index}"
    }
}