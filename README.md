# Terraform

In this post i will try to introduce basics of terraform. This is intended to help you quickly learn the fundamentals of Terraform. Main objectives of this tutorial is to get hands on samples to understand the each topics in Terraform. All examples given in this post are using either Azure or GCP. 

## Prerequisties
An Azure account and a system with terraform installed.

List of topics 

 1. Introduction
 2. Create Configuration
 3. Building Infrastructure in Terraform
 4. Change or update Infrastructure in Terraform
 5. Destroy Infrastructure 
 6. Resource Dependencies _ Interpolation
 7. Provision
 8. How to define variables in Terraform
 9. Loops, Elementsm Ternary Operator
10. States in Terraform Remote State Storage 
11. Modules
12. Terraform Workspace
13. Maintaining multiple environments, providers
14. Terragrunt


## Introduction

What is Terraform : Terraform is an Open source utility, created by HashiCorp Company, the same company that created Vagrant, Vault etc. Terraform is a tool for safely and efficiently building, combining, and launching infrastructure. From physical servers to containers to SaaS products, it is able to create and compose all the components necessary to run any service or application. (https://www.hashicorp.com/blog/terraform.html)

Terraform manages low-level components like storage, networking, and instances as well as high-level components like SaaS and DNS Entries.

Why we need Terraform ? 
   
  *. A tool will monitor the state of the infrastructure 
  *. A script will be sent automatically to fix the issue.
  *. A script can be written to add new instances, and it can be reused.
  *. Faster process, no/less human involvement.
  

## Terraform Configuration

Terraform manages infrastructure provisioning on many service providers. However, in this tutorial, we will get started with the Azure services.A set of files that describe the infrastructure in Terraform is called as `Terraform Configuration`.

Its time for creating infrastructure.

#### Providers ####
 The `provider` block is used to configure the named provider, in this instance the [Azure provider](https://www.terraform.io/docs/providers/azurerm/index.html). The azure provider is responsible for creating and managing the resoources on Azure.
 
 A basic Azure provider block looks like this: 

```
provider "azurerm" {
  version = "1.25.0"
}
 ```
 The `version` argument is optional, but recommended. It is used to constrain the provider to specific version or a range of versions in order to prevent downloading a new provider that may possibly contain **breaking changes**.
 
Provider blocks typically contain addintional fields for identity, environment, role and many others. A complete list of provider fields for Azure is [here](https://www.terraform.io/docs/providers/azurerm/index.html#argument-reference).

Terraform can create configurations across multiple cloud providers. For example single configuration can span both Azure and AWS. In such cases, there will be multiple cloud provider blocks present in the configuration.
   
#### Resources ####
  
A resource block defines a resource that exists within the infrastructure. A resource might be a physical component such as a network interface or it can be a logical resource. 

```
resource "azurerm_resource_group" "rg" {
   name     = "myTFResourceGroup"
   location = "eastus"
}
```

A resource block has 2 tring parameters before opening the block: the resource type(first parameter - azurerm_resource_group) and the resource name(Second parameter- rg). This combination of the type and name must be unique in the configuration. 

In the above example, the reource name is used to refer to the object created in the resource block throughout the configuration, using **interpolation**(Described later.

Complete configuration - Create a file with .tf extension and copy the below code in it . 

```
# Configure the provider
provider "azurerm" {
   version = "=1.20.0"
}

# Create a new resource group
resource "azurerm_resource_group" "rg" {
   name     = "myTFResourceGroup"
   location = "eastus"
}
```

## Building Infrastructure 

Lets use the configuration created in the previous part to build infrastructure on Azure. 

#### Initialization ####

Once the files is created, First command to run for a new congfiguration is ``terraform init``, which initializes various local settings and data that will be used by subsequent commands. see [Terraform:init](https://www.terraform.io/docs/commands/init.html).

Terraform uses a plugin-based architecture to support the numerous infrastructure and service providers available. Each provider is its own encapsulated binary distributed separately from Terraform itself. init command automatically downloand and install any binary for the providers in use within the configuration. 


#### Plan #### 

The ``terraform plan`` command is used to create an execution plan. Its optional command but good to execute each time.

This command is a convenient way to check whether the execution plan for a set of changes matches your expectations without making any changes to real resources or to the state. It **shows all the changes it is going to make**.

#### Apply ####

The ``terraform apply`` command is used to apply the changes required to reach the desired state of the configuration, or the pre-determined set of actions generated by a terraform plan **execution plan**.

Sample execution plan

```
C02XR4S1JG5MMBP:~ srikanth $ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
 + create

Terraform will perform the following actions:

 + azurerm_resource_group.rg
     id:       <computed>
     location: "westus2"
     name:     "myTFResourceGroup"
     tags.%:   <computed>


Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
 Terraform will perform the actions described above.
 Only 'yes' will be accepted to approve.

 ...

```
The execution plan is an important artifact. In practice, you'll usually want to export the plan to a file, review the plan, and then execute that same plan. If you run terraform apply without specifying a plan, Terraform will recalculate the plan, which may vary from the plan you previously created by running terraform plan.

If terraform apply failed with an error, read the error message and fix the error that occurred. At this stage, it is likely to be a syntax error in the configuration.

If the plan was created successfully, Terraform will now pause and wait for approval before proceeding. If anything in the plan seems incorrect or dangerous, it is safe to abort here with no changes made to your infrastructure.


If everything looks good in execution plan and once you give confirmation by typing 'yes' , you will get confirmation on the completion of infrastructure creation. You can validate it by checking it in Portal or cli.

Till now we learned about terraform , configuration and built one simple infrastructure(Azure resource group). I have couple of examples with azure virtual network creation, azure virtual machines in my github [location](https://github.com/Srikanthshetty/terraform/tree/master/azure/basicexamples).

