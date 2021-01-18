resource "aws_instance" "instance"{
    count = length(aws_subnet.publicSubnets)
    subnet_id = aws_subnet.publicSubnets[count.index].id
    ami = "ami-0db0b3ab7df22e366"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.public-sg.id]
    key_name = "ansible"
    iam_instance_profile = aws_iam_instance_profile.ec2_profile.id
    root_block_device{
        volume_size = 20
        volume_type = "gp2"
        delete_on_termination = true
    }
    tags={
        Name="public-${count.index}"
    }
}