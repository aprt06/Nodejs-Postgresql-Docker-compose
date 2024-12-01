terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "terraformstate4develop"
    container_name       = "tfstate"
    key                  = "terraform.tfstate" # State file name
  }
}

provider "azurerm" {
  features {}
}