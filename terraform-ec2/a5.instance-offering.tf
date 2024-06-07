data "aws_availability_zones" "my_zones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in"]
  }
}

#how to chech it
data "aws_ec2_instance_type_offerings" "my_inst_type" {
  #for_each = toset(data.aws_availability_zones.my_zones.names)
  #i am checking for t3 and t2 micro instance
  filter {
    name   = "instance-type"
    values = ["t3.micro","t2.micro"]
  }
###one zone
  filter {
    name   = "location"
    values = ["us-east-1a","us-east-1b"]
  }

  location_type = "availability-zone"
}
#this output will show all the az mapped to a supported instance
/*output "az-avaiable" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_inst_type: az => details.instance_types
  }
}

output "output_v3_2" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_inst_type:
    az => details.instance_types if length(details.instance_types) != 0 }
}
*/