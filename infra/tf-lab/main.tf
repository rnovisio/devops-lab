terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }

  }
  backend "azurerm" {
    resource_group_name  = "rg-lab-tfstate"
    storage_account_name = "sttfstate482"
    container_name       = "tfstate"
    key                  = "tf-lab.tfstate"
  }


}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "lab" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

module "logs" {
  source              = "./modules/storage"
  prefix              = "stlogs"
  resource_group_name = azurerm_resource_group.lab.name
  location            = azurerm_resource_group.lab.location
}

module "backups" {
  source              = "./modules/storage"
  prefix              = "stbak"
  resource_group_name = azurerm_resource_group.lab.name
  location            = azurerm_resource_group.lab.location
}
