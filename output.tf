output "devops-ssh-public_key_fingerprint_md5" {
  value = tls_private_key.devops_ssh_key.public_key_fingerprint_md5
}

output "devops-ssh-private_key_pem" {
  value     = tls_private_key.devops_ssh_key.private_key_pem
  sensitive = true
}

output "devops-ssh-public_key_pem" {
  value = tls_private_key.devops_ssh_key.public_key_pem
}
