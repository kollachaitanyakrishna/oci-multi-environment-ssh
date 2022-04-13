
locals {
  lcl_ssh_private_key_path = format("%s_%s.pem", var.ssh_private_key_path, terraform.workspace)
  lcl_ssh_public_key_path = format("%s_%s.pub", var.ssh_public_key_path, terraform.workspace)
}

# resource generates the ssh key for an identity "devops"
resource "tls_private_key" "devops_ssh_key" {
  algorithm = "RSA"
}

resource "local_sensitive_file" "devops_private_key_path" {
    content  = tls_private_key.devops_ssh_key.private_key_pem
    filename = pathexpand(local.lcl_ssh_private_key_path)
}

resource "local_sensitive_file" "devops_public_key_path" {
    content  = tls_private_key.devops_ssh_key.public_key_pem
    filename = pathexpand(local.lcl_ssh_public_key_path)
}