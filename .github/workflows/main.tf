resource "random_pet" "name_prefix" {
  prefix = var.name_prefix
  length = 1
}

resource "azurerm_resource_group" "default" {
  name     = random_pet.name_prefix.id
  location = var.location
}
  
resource "random_password" "pass" {
  length = 20
}

resource "azurerm_postgresql_flexible_server" "default" {
  name                   = "${random_pet.name_prefix.id}-server"
  resource_group_name    = azurerm_resource_group.default.name
  location               = azurerm_resource_group.default.location
  version                = "13"
  administrator_login    = "adminTerraform"
  administrator_password = random_password.pass.result
  storage_mb             = 32768
  sku_name               = "B_Standard_B1ms"
  zone                   = "2"
  backup_retention_days  = 7

  public_network_access_enabled = true

  delegated_subnet_id = null # Ensures no private VNet is used
}