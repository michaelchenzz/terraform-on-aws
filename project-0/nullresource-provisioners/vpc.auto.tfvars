vpc_cidr_block                         = "10.0.0.0/16"
vpc_availability_zones                 = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
vpc_public_subnets                     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
vpc_private_subnets                    = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
vpc_database_subnets                   = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
vpc_create_database_subnet_route_table = true # Controls if separate route table for database should be created
