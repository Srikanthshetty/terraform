# Configure the provider
provider "azurerm" {
   version             = "1.25.0"
}

# Create a new resource group
resource "azurerm_resource_group" "rg" {
   name                = "myTFResourceGroup"
   location            = "eastus"
}

resource "azurerm_virtual_network" "example" {
  name                = "my-network"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = "myTFResourceGroup"
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name = "myTFResourceGroup"
  virtual_network_name = "${azurerm_virtual_network.example.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_network_interface" "example" {
  name                = "${var.prefix}-nic"
  location            = "eastus"
  resource_group_name = "myTFResourceGroup"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${azurerm_subnet.example.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "example" {
  name                  = "${var.prefix}-vm"
  location            = "eastus"
  resource_group_name = "myTFResourceGroup"
  network_interface_ids = ["${azurerm_network_interface.example.id}"]
  vm_size               = "Standard_F2"

  # This means the OS Disk will be deleted when Terraform destroys the Virtual Machine
  # NOTE: This may not be optimal in all cases.
  delete_os_disk_on_termination = true

  # This means the Data Disk Disk will be deleted when Terraform destroys the Virtual Machine
  # NOTE: This may not be optimal in all cases.
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}