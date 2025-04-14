provider "azurerm" {
  features {}

  # Managed Identity로 인증
  use_msi = true
  alias = "managed-1"
  # 구독 ID 명시 (필수 아님, 환경에 따라 필요)
  subscription_id = var.sub_id
  tenant_id = var.tenant_id
  resource_provider_registrations = "none"
  client_id = var.client1_id

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
  client_id = var.client2_id

}

variable "sub_id" {}
variable "tenant_id" {}
variable "client1_id" {}
variable "client2_id" {}

data "azurerm_resource_group" "rg" {
  provider = azurerm.managed-1

  name = "mw-resource-group-1" # "dwwon-rg-1" 
}

output "id" {
  value = data.azurerm_resource_group.rg.id
}
