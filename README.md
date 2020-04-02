# neko

 Deploy a neko server in Linode.

# Requirements

* a Linode account.
* the `linode.ssh_key` resource is handled elsewhere.

# Usage

To use this module, in your `main.tf` TerraForm code for a deployment insert the following:

``` code
module "neko" {
  source = "github.com/frozenfoxx/terraform-neko-linode"

  authorized_keys = ["${linode_sshkey.terraform.ssh_key}"]
  image           = var.image
  name            = "neko"
  private_key     = chomp(file(var.private_ssh_key))
  region          = var.region
  type            = var.type
}
```
