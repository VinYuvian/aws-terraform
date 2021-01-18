resource "aws_route_table" "public_rtable"{
    vpc_id = aws_vpc.vpc.id 
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags={
        Name = "public"
    }
}

resource "aws_route_table_association" "publicassn"{
    count = length(aws_subnet.publicSubnets)
    subnet_id = aws_subnet.publicSubnets[count.index].id
    route_table_id = aws_route_table.public_rtable.id
}
