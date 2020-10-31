variable "clientId" {}
variable "subscriptionId" {}
variable "tenantId" {}
variable "secretKey" {}

provider "azurerm" {
  client_id = var.clientId
  subscription_id = var.subscriptionId
  tenant_id = var.tenantId
  secret_key = var.secretKey
  features {}
}


variable "rgName" {}
variable "region" {}

resource "azurerm_resource_group" "example" {
  name     = var.rgName
  location = var.region
}

variable "diskName" {}
resource "azurerm_managed_disk" "example" {
  name                 = var.diskName
  location             = var.region
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"

  tags = {
    environment = "staging"
  }
}
