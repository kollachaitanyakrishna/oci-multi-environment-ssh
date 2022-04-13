# Terraform script to generate ssh key based on environment

pre-requisite

- Terraform >v1.1.3

## ✅ Usage

1. Clone the repo to your local laptop.

```bash
git clone <copy from code repo>
```

2. Navigate to the downloaded path

```bash
cd oci-multi-environment-ssh 
```

3. change the path for the generated ssh key in variables.tf

```bash
variable "ssh_private_key_path" {
  default = "~/.ssh/identity_private_key_path_"
}

variable "ssh_public_key_path" {
  default = "~/.ssh/identity_public_key_path_"
}
```

4. set the workspace, possible environments are [dev, test, stage, prod]

```bash
terraform workspace new dev
```

5. check the workspace selection

```bash
terraform workspace list
```

result

```bash
  default
* dev
```

6. execute the plan & apply

```bash
  terraform plan
```

result

```bash
  Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # local_sensitive_file.devops_private_key_path will be created
  + resource "local_sensitive_file" "devops_private_key_path" {
      + content              = (sensitive value)
      + directory_permission = "0700"
      + file_permission      = "0700"
      + filename             = "/Users/ckkolla/.ssh/identity_private_key_path__dev.pem"
      + id                   = (known after apply)
    }

  # local_sensitive_file.devops_public_key_path will be created
  + resource "local_sensitive_file" "devops_public_key_path" {
      + content              = (sensitive value)
      + directory_permission = "0700"
      + file_permission      = "0700"
      + filename             = "/Users/ckkolla/.ssh/identity_public_key_path__dev.pub"
      + id                   = (known after apply)
    }

  # tls_private_key.devops_ssh_key will be created
  + resource "tls_private_key" "devops_ssh_key" {
      + algorithm                  = "RSA"
      + ecdsa_curve                = "P224"
      + id                         = (known after apply)
      + private_key_pem            = (sensitive value)
      + public_key_fingerprint_md5 = (known after apply)
      + public_key_openssh         = (known after apply)
      + public_key_pem             = (known after apply)
      + rsa_bits                   = 2048
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + devops-ssh-private_key_pem            = (sensitive value)
  + devops-ssh-public_key_fingerprint_md5 = (known after apply)
  + devops-ssh-public_key_pem             = (known after apply)
```

7. terraform apply

```bash
Do you want to perform these actions in workspace "dev"?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

tls_private_key.devops_ssh_key: Creating...
tls_private_key.devops_ssh_key: Creation complete after 1s [id=3c9867affc4965fac3f3a4bbc4895ebcc7c1ab11]
local_sensitive_file.devops_public_key_path: Creating...
local_sensitive_file.devops_private_key_path: Creating...
local_sensitive_file.devops_public_key_path: Creation complete after 0s [id=f5b7199e7afb05270624053306388c87a6c0df0b]
local_sensitive_file.devops_private_key_path: Creation complete after 0s [id=3d676cb305c963b1485103f1f99e27d34e26291d]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:

devops-ssh-private_key_pem = <sensitive>
devops-ssh-public_key_fingerprint_md5 = "0e:2f:33:74:82:78:cf:xx:xx:xx:xx:18:0d:81:3c:ad"
devops-ssh-public_key_pem = <<EOT
-----BEGIN PUBLIC KEY-----
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-----END PUBLIC KEY-----
 
```

## 🗨️ References

- terraform tls - <https://registry.terraform.io/providers/hashicorp/tls/latest/docs>
- terraform worspace - <https://www.terraform.io/language/state/workspaces>
