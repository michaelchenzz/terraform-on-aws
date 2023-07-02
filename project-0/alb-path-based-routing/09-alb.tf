module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.7.0"

  name = "${local.name}-alb"

  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.public_subnets
  security_groups = [module.sg_alb.security_group_id]

  # HTTP Listener - HTTP to HTTPS Redirect
  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

  # HTTPS Listener
  https_listeners = [
    {
      port            = 443
      protocol        = "HTTPS"
      certificate_arn = module.acm.acm_certificate_arn
      action_type     = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed Static message - for Root Context"
        status_code  = "200"
      }
    }
  ]

  # HTTPS Rules
  https_listener_rules = [
    # Rule-1: /app1* should go to App1 EC2 Instances
    {
      https_listener_index = 0

      actions = [
        {
          type               = "forward"
          target_group_index = 0
        }
      ]

      conditions = [{
        path_patterns = ["/app1*"]
      }]
    },
    # Rule-2: /app2* should go to App2 EC2 Instances
    {
      https_listener_index = 0

      actions = [
        {
          type               = "forward"
          target_group_index = 1
        }
      ]

      conditions = [{
        path_patterns = ["/app2*"]
      }]
    }
  ]

  # Target Groups
  target_groups = [
    # App1 Target Group - index = 0
    {
      name_prefix          = "app1-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      targets = {
        app1_1 = {
          target_id = module.ec2_private["app1-1"].id
          port      = 80
        },
        app1_2 = {
          target_id = module.ec2_private["app1-2"].id
          port      = 80
        },
        app1_3 = {
          target_id = module.ec2_private["app1-3"].id
          port      = 80
        }
      }
    },
    # App2 Target Group - index = 1
    {
      name_prefix          = "app2-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app2/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      targets = {
        app2_1 = {
          target_id = module.ec2_private["app2-1"].id
          port      = 80
        },
        app2_2 = {
          target_id = module.ec2_private["app2-2"].id
          port      = 80
        },
        app2_3 = {
          target_id = module.ec2_private["app2-3"].id
          port      = 80
        }
      }
    }
  ]
}
