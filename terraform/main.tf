data "tls_public_key" "extracted_key" {
  private_key_openssh = file(var.ssh_private_key_path)
}

resource "hcloud_ssh_key" "vpn_key" {
  name       = "vpn-project-key"
  public_key = data.tls_public_key.extracted_key.public_key_openssh
}

resource "hcloud_server" "vpn_node" {
  name        = var.server_name
  image       = "ubuntu-24.04"
  server_type = "cx23"
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.vpn_key.id]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  user_data = <<EOT
#cloud-config
users:
  - name: x3
    groups: sudo, users
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh_authorized_keys:
      - ${data.tls_public_key.extracted_key.public_key_openssh}
package_update: true
package_upgrade: true
ssh_pwauth: false
disable_root: true
runcmd:
  - echo "Setup done"
EOT

  provisioner "remote-exec" {
    inline = [
      "cloud-init status --wait",
      "sudo -n true"
    ]

    connection {
      type        = "ssh"
      user        = "x3"
      private_key = file(var.ssh_private_key_path)
      host        = self.ipv4_address
      timeout     = "10m"
    }
  }

}
