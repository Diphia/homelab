resource "proxmox_vm_qemu" "kube-1" {
    name = "kube-1"
    desc = "Ubuntu Server node to run Kubernetes"
    vmid = 101
    target_node = "pve-1"

    clone = "ubuntu-cloud"
    cores = 4
    sockets = 1
    cpu = "host"
    memory = 8192

    network {
        bridge = "vmbr0"
        model = "virtio"
    }

    disk {
        storage = "local-lvm"
        type = "scsi"
        size = "50380M"
    }

    os_type = "cloud-init"
    ipconfig0 = "ip=10.0.2.1/8,gw=10.0.0.2"
    nameserver = "198.18.0.2"
    ciuser = "serveradmin"
    sshkeys = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5ig6bQXTdeWyKbz91o1mE2FMxerZkjXhe4Sr8dlNvg7uRF8B1+MYgezMQl7QnrJ0M64BFEQdKRrokQG4m50ddryhsk5YtIHfzrgeu8DxbWR323FkasUztAYE4I+frKRQSElMkElIl6XusfJdAMJx2X62/u37OQEpjSJ5Jpp1uNV6B/KOfQbozjWYauWbpoNJ0ChuUFas7e351KMpJdZgeAJ2E9qnSrqhiwnkriISYYiGZaqOsvAIOYd9mVaGWjgNxWaluBBqg3C+y+0f9bjG9wMhE0Y8F1K8K4yYSB6DnnkYPVe9310ZDry2OOSIJJopuDioJ6ikVbLt45JIHRrfHAHGD6hDRJi7goJINB7+rxJ9dGbFZCvHC0jxWRWsgHDG/21/vicFqo7QHYNnnz/XOZXl1VS2yTm+M0I4K9EgWM11z4NcfOYF4YXfNXq7f2BNgls86NyPbreo3dVQ261zHrpD8KV/H0eKILapcPP8N/5RwSBrG1L7DHQMIQAWuW50= diphia@mac-server.local
    EOF
}
