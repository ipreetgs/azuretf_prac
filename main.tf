terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.98.0"
    }
  }
}

provider "azurerm" {
  features {}


}
resource "azurerm_resource_group" "thepreetrs" {
  name     = "api-rg-pro"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "thepreetrs" {
  name                = "api-appserviceplan-pro"
  location            = azurerm_resource_group.thepreetrs.location
  resource_group_name = azurerm_resource_group.thepreetrs.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service" "thepreetrs" {
  name                = "thepreetrs-app-service"
  location            = azurerm_resource_group.thepreetrs.location
  resource_group_name = azurerm_resource_group.thepreetrs.name
  app_service_plan_id = azurerm_app_service_plan.thepreetrs.id

 
}

resource "azurerm_storage_account" "thepreetrs" {
  name                     = "ipreetstaragwe"
  resource_group_name      = azurerm_resource_group.thepreetrs.name
  location                 = azurerm_resource_group.thepreetrs.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "preet"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.dev_var
  location = "West Europe"
}
resource "azurerm_resource_group" "rg2" {
  name     = var.qa_var
  location = "West Europe"
}
