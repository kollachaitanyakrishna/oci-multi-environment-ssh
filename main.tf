# a local variable used to get the envrionment.
locals {
  environment = lookup(var.workspace_to_environment_map, terraform.workspace, "dev")
}
