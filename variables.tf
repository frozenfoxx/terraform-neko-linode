variable "authorized_keys" {
  default = ["default-ssh-public-key"]
  description = "Public key used for SSH connections"
}

variable "image" {
  default = "linode/ubuntu18.04"
  description = "Image used for deployment"
}

variable "group" {
  default = "neko"
  description = "Display group"
}

variable "region" {
  default = "us-central"
  description = "Region to clone in"
}

variable "root_pass" {
  default = ""
  description = "Password for the persistent user"
}

variable "tags" {
  default = [ "streaming" ]
  description = "Tags to apply"
}

variable "type" {
  default = "g6-standard-1"
  description = "Type of instance"
}
