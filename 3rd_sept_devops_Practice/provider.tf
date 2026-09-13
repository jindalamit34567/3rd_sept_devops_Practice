terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "amitjindal-rg"
    storage_account_name = "amitjindalstorage1"
    container_name       = "tfstate"
    key                  = "resource_group.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "0dbb6e8c-757b-422f-8043-f33ac4fe80f3"
}