# Virtual Network

In this example we created new resource group and used that resource group to create virtual network.

Terraform plan command output
```
$ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + azurerm_virtual_network.test
      id:                  <computed>
      address_space.#:     "1"
      address_space.0:     "10.0.0.0/16"
      location:            "eastus"
      name:                "myvnet"
      resource_group_name: "user-ktcnagxwximx"
      subnet.#:            <computed>
      tags.%:              <computed>


Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

Terraform apply output

```
$ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + azurerm_virtual_network.test
      id:                  <computed>
      address_space.#:     "1"
      address_space.0:     "10.0.0.0/16"
      location:            "eastus"
      name:                "myvnet"
      resource_group_name: "user-ktcnagxwximx"
      subnet.#:            <computed>
      tags.%:              <computed>


Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes
  
  azurerm_virtual_network.test: Creating...
  address_space.#:     "" => "1"
  address_space.0:     "" => "10.0.0.0/16"
  location:            "" => "eastus"
  name:                "" => "myvnet"
  resource_group_name: "" => "user-ktcnagxwximx"
  subnet.#:            "" => "<computed>"
  tags.%:              "" => "<computed>"
azurerm_virtual_network.test: Still creating... (10s elapsed)
azurerm_virtual_network.test: Creation complete after 13s (ID: /subscriptions/23c7f465-e27b-418b-b8a7-...crosoft.Network/virtualNetworks/myvnet)

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```
