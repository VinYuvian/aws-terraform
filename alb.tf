resource "aws_lb" "front"{
    name = "front-alb"
    internal = false
    load_balancer_type = "application"
    subnets = aws_subnet.publicSubnets.*.id
    security_groups = [aws_security_group.public-sg.id]
    enable_deletion_protection = true
}
resource "aws_lb_target_group" "alb-front"{
    name = "alb-front"
    port = "80"
    protocol = "HTTP"
    vpc_id = aws_vpc.vpc.id
}

resource "aws_lb_listener" "alb"{
    load_balancer_arn = aws_lb.front.arn
    port = "80"
    protocol = "HTTP"
    default_action{
        type = "forward"
        target_group_arn = aws_lb_target_group.alb-front.arn
    }
}

resource "aws_lb_target_group_attachment" "front-attach"{
    count = length(aws_instance.instance.*)
    target_group_arn = aws_lb_target_group.alb-front.arn 
    target_id = aws_instance.instance[count.index].id
    port = 80
}