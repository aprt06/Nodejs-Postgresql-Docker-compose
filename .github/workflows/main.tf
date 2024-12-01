provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "example" {
  name     = "postgres-example-rg"
  location = "eastus"
}

# PostgreSQL Server
resource "azurerm_postgresql_flexible_server" "example" {
  name                = "example-postgres-server"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  version             = "13"

  administrator_login          = "postgres"
  administrator_password       = "123"

  sku_name   = "Standard_B1ms"
  storage_mb = 5120

  backup_retention_days = 7
  geo_redundant_backup_enabled = false
  delegated_subnet_id = null # Replace if using VNet
}

# PostgreSQL Database
resource "azurerm_postgresql_flexible_database" "example" {
  name                = "testdb"
  server_id           = azurerm_postgresql_flexible_server.example.id
  collation           = "en_US.UTF8"
  charset             = "UTF8"
}

# PostgreSQL Firewall Rule
resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_all" {
  name                = "AllowAllIPs"
  server_id           = azurerm_postgresql_flexible_server.example.id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}

# Outputs for connection
output "db_host" {
  value = azurerm_postgresql_flexible_server.example.fqdn
}

output "db_user" {
  value = azurerm_postgresql_flexible_server.example.administrator_login
}

output "db_password" {
  value = azurerm_postgresql_flexible_server.example.administrator_password
}

output "db_name" {
  value = azurerm_postgresql_flexible_database.example.name
}
