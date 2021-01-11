provider "azurerm" {

  features {}
}

resource "azurerm_resource_group" "cloudengineering-rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_network_security_group" "cloudengineering-sg" {
  name                = var.sg_name
  location            = azurerm_resource_group.cloudengineering-rg.location
  resource_group_name = azurerm_resource_group.cloudengineering-rg.name
}

resource "azurerm_network_ddos_protection_plan" "cloudengineering-ddos" {
  name                = "ddospplan"
  location            = azurerm_resource_group.cloudengineering-rg.location
  resource_group_name = azurerm_resource_group.cloudengineering-rg.name
}

resource "azurerm_virtual_network" "cloudengineering-vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.cloudengineering-rg.location
  resource_group_name = azurerm_resource_group.cloudengineering-rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.cloudengineering-ddos.id
    enable = true
  }

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
    security_group = azurerm_network_security_group.cloudengineering-sg.id
  }

  tags = {
    environment = "Production"
  }
}