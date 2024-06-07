resource "aws_instance" "web" {
  ami                    = "ami-00beae93a2d981137"
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app/app.sh")
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  tags = {
    "Name" = random_pet.pet_name.id
  }

 # lifecycle {
  #  create_before_destroy = true
  #}

  lifecycle {
    ignore_changes = [
        tags
     ]
     create_before_destroy = true
  }

}
