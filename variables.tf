variable "ssh_private_key_path" {
  default = "~/.ssh/identity_private_key_path_"
}

variable "ssh_public_key_path" {
  default = "~/.ssh/identity_public_key_path_"
}

variable "workspace_to_environment_map" {
  type = map(any)
  default = {
    dev     = "dev"
    qa      = "test"
    staging = "stage"
    prod    = "prod"
  }
}