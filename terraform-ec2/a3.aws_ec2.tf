resource "aws_instance" "web" {
  ami                    = data.aws_ami.amznlinux2.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app/app.sh")
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  tags = {
    "Name" = random_pet.pet_name.id
  }
  #for_each = toset(keys({for az, details in data.aws_ec2_instance_type_offerings.my_inst_type:
  #az => details.instance_types if length(details.instance_types)!=0}))
}