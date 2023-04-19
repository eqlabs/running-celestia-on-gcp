resource "google_compute_instance" "celestia_bridge_node" {
  project      = var.project_id
  name         = "celestia-bridge-node"
  machine_type = "e2-highcpu-8"
  zone         = "europe-west1-b"

  tags = ["allow-ssh", "celestia-rpc"]

  description = "This instance runs a Celestia bridge node"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
      size  = "500"
    }
  }

  network_interface {
    network    = google_compute_network.celestia_network.id
    subnetwork = google_compute_subnetwork.celestia_public_subnet.id
    access_config {
      network_tier = "STANDARD"
    }
  }


  labels = {
    terraform_managed = "true"
    region            = "europe-west1"
  }

}
