# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "4.80.0"
#     }
#   }

# backend "azurerm" {
#   resource_group_name  = "amitjindal-rg"
#   storage_account_name = "amitjindalstorage"
#   container_name       = "tfstate"
#   key                  = "resource_group.tfstate"
# }
# }
# provider "azurerm" {
#   features {}
#   subscription_id = "b4ae5a45-b36d-445c-99a5-c39ef04e44dc"
# }