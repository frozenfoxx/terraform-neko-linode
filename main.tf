resource "linode_instance" "main" {
  label = var.name
  image = var.image
  region = var.region
  type = var.type
  authorized_keys = var.authorized_keys
  root_pass = var.root_pass

  group = var.group
  tags = var.tags

  provisioner "file" {
    source = "${path.module}/scripts"
    destination = "/tmp"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod 755 /tmp/*.sh",
      "sudo /tmp/install_docker.sh",
      "sudo /tmp/install_neko.sh"
    ]
  }
}
