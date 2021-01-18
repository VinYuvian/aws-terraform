resource "aws_route_table" "pvt_rtable"{
    vpc_id = aws_vpc.vpc.id 
    tags={
        Name = "private"
    }
}

resource "aws_route_table_association" "pvtassn"{
    count = length(aws_subnet.privateSubnets)
    subnet_id = aws_subnet.privateSubnets[count.index].id 
    route_table_id = aws_route_table.pvt_rtable.id
}