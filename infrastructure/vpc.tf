resource "google_compute_network" "celestia_network" {
  name                    = "celestia-vpc"
  description             = "Celestia main VPC network"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "celestia_public_subnet" {
  name                     = "celestia-public-subnet"
  ip_cidr_range            = "10.0.128.0/18"
  region                   = var.region
  network                  = google_compute_network.celestia_network.id
  private_ip_google_access = true
}

resource "google_compute_firewall" "allow_ssh_rule" {
  name = "allow-ssh-rule"
  network = google_compute_network.celestia_network.name

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  target_tags = ["allow-ssh"]
  # You can change this line to a set of IPs you know you'll be connecting to.
  source_ranges = ["0.0.0.0/0"]

}

resource "google_compute_firewall" "allow_celestia_ports_rule" {
  name = "allow-celestia-ports-rule"
  network = google_compute_network.celestia_network.name

  allow {
    protocol = "tcp"
    ports = ["2121", "26658", "26659", "9090"]
  }

  target_tags = ["celestia-rpc"]
  # You can change this line to a set of IPs you know you'll be connecting to.
  source_ranges = ["0.0.0.0/0"]

}


