variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type        = string
  sensitive   = true
}

variable "server_name" {
  default = "vpn-master"
}

variable "location" {
  default = "fsn1"
}

variable "ssh_private_key_path" {
  description = "Путь к приватному ключу"
  type        = string
  default     = "../.ssh/id_ed25519"
}
