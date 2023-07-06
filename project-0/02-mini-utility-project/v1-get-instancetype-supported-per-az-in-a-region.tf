# Datasource
data "aws_ec2_instance_type_offerings" "my_ins_type1" {
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name = "location"
    #values = ["us-east-1a"]
    values = ["us-east-1e"]
  }

  location_type = "availability-zone"
}

# Output v1: Check whether or not an instance type is supported in a particular availability zone
output "output_v1" {
  value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
}
