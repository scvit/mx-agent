terraform {
  required_providers {
    azapi = {
      source = "Azure/azapi"
    }
  }
}


provider "azurerm" {
  features {}

  # Managed Identity로 인증
  use_msi = true
  alias = "managed-1"
  # 구독 ID 명시 (필수 아님, 환경에 따라 필요)
  subscription_id = var.sub_id
  tenant_id = var.tenant_id
  resource_provider_registrations = "none"
# resource_providers_to_register = "none"
  # client_id = var.client1_id

}


provider "azurerm" {
  features {}

  # Managed Identity로 인증
  use_msi = true
   alias = "managed-2"
  # 구독 ID 명시 (필수 아님, 환경에 따라 필요)
  subscription_id = var.sub_id
  tenant_id = var.tenant_id
  resource_provider_registrations = "none"
  # resource_providers_to_register = "none"
  # client_id = var.client2_id
 # skip_provider_registration = true
 # metadata_host = "10.0.2.5"

}

/*
provider "azurerm" {
  resource_provider_registrations = "none"
  # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  alias = "my"
  subscription_id = var.sub_id
  
  
}

*/


variable "sub_id" {}
variable "tenant_id" {}
variable "client1_id" {}
variable "client2_id" {}


/*
data "azurerm_resource_group" "rg" {
   provider = azurerm.managed-2

  name = "mw-resource-group-2" # "dwwon-rg-1" 
}

output "id" {
  value = data.azurerm_resource_group.rg.id
}

*/


 resource "azurerm_virtual_network" "rg2_vpc" {
    provider = azurerm.managed-2
   name                = "mwjo-network-rg2"
   address_space       = ["10.13.0.0/16"]
   location            = "Korea Central"
   resource_group_name = "jmw-rg-2" # jmw-rg-2 # mw-resource-group-2 
 }



/*

resource "azurerm_storage_account" "sa" {
provider = azurerm.managed-2
  name                     = "storermpldemo123"
  resource_group_name      = "mw-resource-group-2"
  location                 = "korea central"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


*/






/*

## azapi

provider "azapi" {
  use_msi = true
  # 구독 ID 명시 (필수 아님, 환경에 따라 필요)
  subscription_id = var.sub_id
  tenant_id = var.tenant_id
}

# azapi data source를 사용하여 리소스 그룹 정보 가져오기
data "azapi_resource" "resource_group" {
  type      = "Microsoft.Resources/resourceGroups@2021-04-01"
  name      = "mw-resource-group-2"
  parent_id = "/subscriptions/${var.sub_id}"
}

# 출력으로 리소스 그룹 ID 표시
output "resource_group_id" {
  value = data.azapi_resource.resource_group.id
}
*/
