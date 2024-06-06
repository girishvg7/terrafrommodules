#to define input varaible
variable "resource_group_name" {
  description = "this contains rg name"
  type        = string #list string array map number
 # default     = "rg-default"
}

#hr-sap-rg-default
#name to an expression

variable "resource_group_location" {
  description = "this is the resource group location"
  type        = string
  #default     = "eastus"
}

variable "business_devision" {
  #if you do not define type it will always take the type as 
  type    = string
  #default = "sap"
}

variable "environment" {
  type    = string
 # default = "hr"
}

variable "vnet_name" {
  type    = string
  #default = "vnet-default"
}

variable "vnet_address_space" {
  type    = list(string)
  #default = ["10.0.0.0/16"]
}

variable "web_subnet_name" {
  type    = string
  #default = "websubnet"
}

variable "web_subnet_address" {
  type    = list(string)
  #default = ["10.0.1.0/24"]
}