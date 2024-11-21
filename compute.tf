resource "aws_launch_template" "EVE-lauch-template" {
    name          = "launch-template"
    image_id      = var.image
    instance_type = var.instance_type
    key_name      = "EVE-SSH"

    #vpc_security_group_ids  =   var.default_sg

    network_interfaces {
        associate_public_ip_address = false
        security_groups = var.default_sg
              
    }
}

resource "aws_autoscaling_group" "auto-scaling-group" {
    name = "${var.name}-Auto-Scaling-Group"
    availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"] 
    desired_capacity     = var.desired_capacity
    max_size             = var.max_size
    min_size             = var.min_size
    
    launch_template {
        id      = aws_launch_template.EVE-lauch-template.id
        version = "$Latest"
        
    }
    

    tag {
        key                 = "Name"
        value               = "${var.name}-Instance-AutoScaled"
        propagate_at_launch = true
    }

    tag {
       key                 = "Owner"
       value               = "EVE"
       propagate_at_launch = true
    }

    tag {
      key                 = "Use"
      value               = "TP-Terraform"
      propagate_at_launch = true
    }



}
