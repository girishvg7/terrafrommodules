variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "business_devision" {
  #if you do not define type it will always take the type as 
  type    = string
  default = "sap"
}

variable "environment" {
  type    = string
  default = "hr"
}

variable "instance_type" {
  default = "t2.micro"
}