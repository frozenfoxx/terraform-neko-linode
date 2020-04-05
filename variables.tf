variable "authorized_keys" {
  default     = [""]
  description = "List of public keys used for SSH connections"
}

variable "image" {
  default     = "linode/ubuntu18.04"
  description = "Image used for deployment"
}

variable "group" {
  default     = "neko"
  description = "Display group"
}

variable "name" {
  default     = "neko"
  description = "Hostname of the system"
}

variable "neko_password" {
  default     = "neko"
  description = "Basic user password access for Neko"
}

variable "neko_password_admin" {
  default     = "admin"
  description = "Administrator password access for Neko"
}

variable "private_key" {
  default     = ""
  description = "Private SSH key for the root user"
}

variable "region" {
  default     = "us-central"
  description = "Region to clone in"
}

variable "root_pass" {
  default     = ""
  description = "Password for the persistent user"
}

variable "tags" {
  default     = [ "streaming" ]
  description = "Tags to apply"
}

variable "type" {
  default     = "g6-standard-1"
  description = "Type of instance"
}
