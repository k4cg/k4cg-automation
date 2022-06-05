terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.8.0"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://<PROXMOX_IP>:8006/api2/json"
  pm_tls_insecure = "true"
#   pm_user         = "<PROMOX_USER>"
#   pm_password     = "<PROXMOX_PASSWORD>"
#   pm_log_enable   = true
#   pm_log_file     = "<PATH_TO_LOGFILE>"
#   pm_log_levels = {
#     _default    = "debug"
#     _capturelog = ""
#   }
}

variable "ssh_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKVfDh/BXJFNZscs5KBcMrFeuNSAOVsIGQ5i5qAkOWjt"
}

resource "proxmox_vm_qemu" "cloud-init-test-1" {
  name = "cloud-init-test-1"
  desc = "first tf cloud-init test"
  target_node = "proxmox"
  clone = "ubuntu-20.04-lts-template"
  full_clone = "true"
  os_type = "cloud-init"
  agent = 1
  cores = 4
  sockets = 1
  cpu = "kvm64"
  memory = 2048
  scsihw = "virtio-scsi-pci"
  hotplug = "disk,network,usb,cpu"
  # bios = "ovmf"
  disk { 
    type = "virtio"
    storage = "local-lvm"
    size = "20G"
  }
  # disk {
  #   type = "efi"
  #   storage = "local-lvm"
  #   size = "1M"
  # }
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  
  ipconfig0 = "ip=<IP_ADDRESS>/24,gw=<GATEWAY_IP>"
  ciuser = ""
  cipassword = ""
  sshkeys = <<EOF
${var.ssh_key}
EOF
}

