# Configure the provider
provider "azurerm" {
   version         = "1.25.0"
}

# Create a new resource group
resource "azurerm_resource_group" "rg" {
   name     = "myTFResourceGroup"
   location = "eastus"
}

# Create a new Virtual network

resource "azurerm_virtual_network""myterraformnetwork"
  {
     name = "myvnet"
     address_space = ["10.0.0.0/16"]
     location="eastus"
     resource_group_name="myTFResourceGroup"
   }

