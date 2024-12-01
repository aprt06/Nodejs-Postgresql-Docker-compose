terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "terraformstate4develop"
    container_name       = "tfstate"
    key                  = "terraform.tfstate" # State file name
  }
}
