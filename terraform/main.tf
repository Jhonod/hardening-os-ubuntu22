provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_instance" "ubuntu_vm" {
  name         = "ubuntu-hardening-vm"
  machine_type = "e2-micro"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }

  tags = ["ssh"]
}

output "instance_ip" {
  value = google_compute_instance.ubuntu_vm.network_interface[0].access_config[0].nat_ip
}