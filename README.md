# neko

 Deploy a neko server in Linode.

# Requirements

This module requires a Linode account.

# Usage

To use this module, in your `main.tf` TerraForm code for a deployment insert the following:

``` code
module "neko" {
  source = "git::git@github.com:frozenfoxx/terraform-neko-linode.git"

  authorized_keys = var.authorized_keys
  image           = var.image
  region          = var.region
  root_pass       = var.root_pass
}
```