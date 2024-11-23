#Creating VPC network:
resource "google_compute_network" "vpc-network" {
  count                           = length(var.vpc)
  name                            = var.vpc[count.index]
  auto_create_subnetworks         = var.auto_create_subnetworks
}

#Creating Subnet:
resource "google_compute_subnetwork" "subnets" {
  count         = length(var.subnets)
  name          = var.subnets[count.index]
  region        = var.subnet_regions[count.index]
  ip_cidr_range = var.cidr_range[count.index]
  network       = google_compute_network.vpc-network[count.index].id

    log_config {
    aggregation_interval = var.aggregation_interval
    flow_sampling        = var.flow_sampling
    metadata             = var.subnet_metadata
  }

}

#Creating the firewall rule:
resource "google_compute_firewall" "firewall" {
  count         = length(var.firewall)
  name          = var.firewall[count.index]
  network       = google_compute_network.vpc-network[count.index].id
  source_ranges = var.source_ranges
    
    allow {
    protocol = var.protocol
    ports    = var.ports
  }
  log_config {
   metadata = var.firewall_metadata
  }
  source_tags = var.source_tags
  target_tags = var.target_tags
}
