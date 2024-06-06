
##we will create a vnet
resource "azurerm_virtual_network" "vnet" {
  name = "${local.resource_name_prefix}-${var.vnet_name}"
  #location and rg name is combination of regroup.label.location and name
  location = azurerm_resource_group.myrg.location
  #nameoftheresource.label.location
  #from where it will pick up from tfstate file
  resource_group_name = azurerm_resource_group.myrg.name
  address_space       = var.vnet_address_space

  tags = local.common_tags
}

resource "azurerm_subnet" "mysubnet" {
  name                 = "${local.resource_name_prefix}-${var.web_subnet_name}"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.web_subnet_address
}

locals {
  owners               = var.business_devision
  environment          = var.environment
  resource_name_prefix = "${var.business_devision}-${var.environment}"
  #sap-hr
  common_tags = { #name is comon tag
    #we have define two expression but expression are in key value format
    owners      = local.owners
    environment = local.environment
    
  }
}

#the block start with resource
#type or resource which i want to creater
#label unique
resource "azurerm_resource_group" "myrg" {
  #inside the resource block we provided argument
  name = "${local.resource_name_prefix}-${var.resource_group_name}"
  #sap-hr-rg-default
  ##to call a variable we will use var.nameofthevariables
  location = var.resource_group_location
  tags     = local.common_tags
}
