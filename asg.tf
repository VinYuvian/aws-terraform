resource "aws_launch_template" "front"{
    name = "template"
    key_name = "ansible"
    image_id = "ami-0db0b3ab7df22e366"
    iam_instance_profile{
        name = "ec2-profile"
    }
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.public-sg.id]

}
resource "aws_autoscaling_group" "asg"{
    name = "front"
    max_size = 3
    min_size = 1
    desired_capacity = 2
    health_check_type = "ELB"
    health_check_grace_period = 300
    vpc_zone_identifier = aws_subnet.publicSubnets.*.id
    launch_template {
      id = aws_launch_template.front.id
      version = "$Latest"
    }
}

resource "aws_autoscaling_policy" "policy_up" {
  name                   = "policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.asg.name
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm_down"{
    alarm_name = "cpu_alarm_down"
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = 2
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "120"
    statistic = "Average"
    threshold = "60"
    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.asg.name
    }

    alarm_description = "This metric monitor ec2 instance cpu utilization"
    alarm_actions = [ aws_autoscaling_policy.policy_up.arn ]
}