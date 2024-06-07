locals {
  inbound_ports  = [80, 443, 22]
  outbound_ports = [0]
}
#inside the resource block we have nested block
resource "aws_security_group" "allow_http" {
  name        = random_pet.pet_name.id
  description = "Allow ssh inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id
  dynamic "ingress" {
    for_each = local.inbound_ports
    #for dynamic nested block we need to iterate
    content {
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

  }
  dynamic "egress" {
    for_each = local.outbound_ports
    content {
      from_port        = egress.value
      to_port          = egress.value
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

  }
  tags = {
    "Name" = random_pet.pet_name.id
  }
}