resource "azurerm_key_vault" "kv" {
  name                = "kv-${var.prefix}-${var.postfix}${var.env}"
  location            = var.location
  resource_group_name = var.rg_name
  tenant_id           = var.tenant_id
  sku_name            = "standard"

  tags = var.tags
  access_policy {
    tenant_id = var.tenant_id
    object_id = uuidv5("oid",var.object_id)

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}
