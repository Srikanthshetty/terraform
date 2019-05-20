```$ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + azurerm_network_interface.example
      id:                                                                 <computed>
      applied_dns_servers.#:                                              <computed>
      dns_servers.#:                                                      <computed>
      enable_accelerated_networking:                                      "false"
      enable_ip_forwarding:                                               "false"
      internal_dns_name_label:                                            <computed>
      internal_fqdn:                                                      <computed>
      ip_configuration.#:                                                 "1"
      ip_configuration.0.application_gateway_backend_address_pools_ids.#: <computed>
      ip_configuration.0.application_security_group_ids.#:                <computed>
      ip_configuration.0.load_balancer_backend_address_pools_ids.#:       <computed>
      ip_configuration.0.load_balancer_inbound_nat_rules_ids.#:           <computed>
      ip_configuration.0.name:                                            "testconfiguration1"
      ip_configuration.0.primary:                                         <computed>
      ip_configuration.0.private_ip_address_allocation:                   "dynamic"
      ip_configuration.0.private_ip_address_version:                      "IPv4"
      ip_configuration.0.subnet_id:                                       "${azurerm_subnet.example.id}"
      location:                                                           "eastus"
      mac_address:                                                        <computed>
      name:                                                               "my-nic"
      private_ip_address:                                                 <computed>
      private_ip_addresses.#:                                             <computed>
      resource_group_name:                                                "user-xvwskdkfzbjc"
      tags.%:                                                             <computed>
      virtual_machine_id:                                                 <computed>

  + azurerm_subnet.example
      id:                                                                 <computed>
      address_prefix:                                                     "10.0.2.0/24"
      ip_configurations.#:                                                <computed>
      name:                                                               "internal"
      resource_group_name:                                                "user-xvwskdkfzbjc"
      virtual_network_name:                                               "my-network"

  + azurerm_virtual_machine.example
      id:                                                                 <computed>
      availability_set_id:                                                <computed>
      delete_data_disks_on_termination:                                   "true"
      delete_os_disk_on_termination:                                      "true"
      identity.#:                                                         <computed>
      location:                                                           "eastus"
      name:                                                               "my-vm"
      network_interface_ids.#:                                            <computed>
      os_profile.#:                                                       "1"
      os_profile.1173764063.admin_password:                               <sensitive>
      os_profile.1173764063.admin_username:                               "testadmin"
      os_profile.1173764063.computer_name:                                "hostname"
      os_profile.1173764063.custom_data:                                  <computed>
      os_profile_linux_config.#:                                          "1"
      os_profile_linux_config.2972667452.disable_password_authentication: "false"
      os_profile_linux_config.2972667452.ssh_keys.#:                      "0"
      resource_group_name:                                                "user-xvwskdkfzbjc"
      storage_data_disk.#:                                                <computed>
      storage_image_reference.#:                                          "1"
      storage_image_reference.1458860473.id:                              ""
      storage_image_reference.1458860473.offer:                           "UbuntuServer"
      storage_image_reference.1458860473.publisher:                       "Canonical"
      storage_image_reference.1458860473.sku:                             "16.04-LTS"
      storage_image_reference.1458860473.version:                         "latest"
      storage_os_disk.#:                                                  "1"
      storage_os_disk.0.caching:                                          "ReadWrite"
      storage_os_disk.0.create_option:                                    "FromImage"
      storage_os_disk.0.disk_size_gb:                                     <computed>
      storage_os_disk.0.managed_disk_id:                                  <computed>
      storage_os_disk.0.managed_disk_type:                                "Standard_LRS"
      storage_os_disk.0.name:                                             "myosdisk1"
      storage_os_disk.0.write_accelerator_enabled:                        "false"
      tags.%:                                                             <computed>
      vm_size:                                                            "Standard_F2"

  + azurerm_virtual_network.example
      id:                                                                 <computed>
      address_space.#:                                                    "1"
      address_space.0:                                                    "10.0.0.0/16"
      location:                                                           "eastus"
      name:                                                               "my-network"
      resource_group_name:                                                "user-xvwskdkfzbjc"
      subnet.#:                                                           <computed>
      tags.%:                                                             <computed>


Plan: 4 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.```
