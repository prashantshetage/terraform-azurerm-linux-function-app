module "storage_account" {
  source               = "github.com/prashantshetage/terraform-azurerm-storage-account?ref=azurerm_v3"
  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = "sa${var.name}"

  # To enable advanced threat protection set argument to `true`
  enable_advanced_threat_protection = var.enable_advanced_threat_protection

  # Network Rules
  ip_rules = var.custom_ip_rules #[data.http.myip.body]

  virtual_network_subnet_ids = [
    /* module.subnet.subnet.utilities.id,
    module.subnet.subnet.application.id,
    module.subnet.subnet.database.id,
    module.subnet.subnet.gateway.id,
    # module.subnet.subnet.rediscache.id,
    module.subnet.subnet.aks.id,
    module.subnet.subnet.acr.id */
  ]
  # NSG Flow Log container
  containers_list = var.containers_list
  file_shares     = var.file_shares
  tags            = var.tags
}