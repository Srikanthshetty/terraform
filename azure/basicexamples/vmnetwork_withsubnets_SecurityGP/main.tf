# Configure the provider
provider "azurerm" {
   version             = "1.25.0"
}

# Create a new resource group
resource "azurerm_resource_group" "rg" {
   name                = "myTFResourceGroup"
   location            = "eastus"
}

# Create a new Virtual network

resource "azurerm_virtual_network""myterraformnetwork"{
  name                 = "myvnet"
  address_space        = ["10.0.0.0/16"]
  location             = "eastus"
  resource_group_name  = "myTFResourceGroup"
   }

resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  virtual_network_name = "myvnet"
  resource_group_name  = "myTFResourceGroup"
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet" "backend" {
  name                 = "backend"
  virtual_network_name = "myvnet"
  resource_group_name  = "myTFResourceGroup"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_subnet" "database" {
  name                 = "database"
  virtual_network_name = "myvnet"
  resource_group_name  = "myTFResourceGroup"
  address_prefix       = "10.0.3.0/24"
}

resource "azurerm_network_security_group" "example" {
  name                 = "my-nsg"
  location             = "eastus"
  resource_group_name  = "myTFResourceGroup"
}

# NOTE: this allows SSH from any network
resource "azurerm_network_security_rule" "ssh" {
  name                 = "ssh"
  resource_group_name  = "myTFResourceGroup"
  network_security_group_name = "my-nsg"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}