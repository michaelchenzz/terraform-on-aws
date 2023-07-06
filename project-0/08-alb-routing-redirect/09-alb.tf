module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.7.0"

  name = "${local.name}-alb"

  load_balancer_type = "application"

  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets

  # Attach rules to the created security group
  security_group_rules = {
    ingress_all_http = {
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP web traffic"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress_all_https = {
      type        = "ingress"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "HTTPS web traffic"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress_all = {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

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
      port     = 443
      protocol = "HTTPS"
      # certificate_arn = module.acm.acm_certificate_arn
      certificate_arn = var.myssl_arn
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
    # Rule-1: custom-header=my-app-1 should go to App1 EC2 Instances
    {
      https_listener_index = 0
      priority             = 1
      actions = [
        {
          type               = "forward"
          target_group_index = 0
        }
      ]

      conditions = [{
        http_headers = [{
          http_header_name = "custom_header"
          values           = ["app1", "my-app-1"]
        }]
      }]
    },
    # Rule-2: custom-header=my-app-2 should go to App2 EC2 Instances
    {
      https_listener_index = 0
      priority             = 2
      actions = [
        {
          type               = "forward"
          target_group_index = 1
        }
      ]

      conditions = [{
        http_headers = [{
          http_header_name = "custom_header"
          values           = ["app2", "my-app-2"]
        }]
      }]
    },
    # Rule-3: When Query-String website=ec2-instances redirect to https://instances.vantage.sh/
    {
      https_listener_index = 0
      priority             = 3
      actions = [
        {
          type        = "redirect"
          status_code = "HTTP_302"
          host        = "instances.vantage.sh"
          path        = ""
          query       = ""
          protocol    = "HTTPS"
        }
      ]

      conditions = [{
        query_strings = [{
          key   = "website"
          value = "ec2-instances"
        }]
      }]
    },
    # Rule-4: When Host Header = git.rshcmdevops.com, redirect to https://github.com/michaelchenzz/terraform-on-aws-ec2
    {
      https_listener_index = 0
      priority             = 4
      actions = [
        {
          type        = "redirect"
          status_code = "HTTP_302"
          host        = "github.com"
          path        = "/michaelchenzz/terraform-on-aws-ec2"
          query       = ""
          protocol    = "HTTPS"
        }
      ]

      conditions = [{
        host_headers = ["git.rshcmdevops.com"]
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
