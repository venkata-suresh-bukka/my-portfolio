#Node Pool.......................................................................................
resource "google_container_node_pool" "node_pool" {
  project        = var.project_id
  name           = var.node_pool
  cluster        = var.cluster
  location       = var.location
  # node_locations = var.node_locations

  initial_node_count = var.initial_node_count

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }

  node_config {
    machine_type = var.node_machine_type
    image_type   = var.node_image_type
    preemptible  = var.preemptible
    disk_size_gb = var.disk_size_gb
    disk_type    = var.disk_type

    # Google recommends custom service accounts that have cloud-platform scope and 
    # permissions granted via IAM Roles.
    service_account = var.service_account
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]

    labels = var.labels
    tags   = var.target_tags

    shielded_instance_config {
      enable_secure_boot          = var.enable_secure_boot
      enable_integrity_monitoring = var.enable_integrity_monitoring
    }

  }

  upgrade_settings {
    strategy        = var.upgrade_stratergy
    max_surge       = var.max_surge
    max_unavailable = var.max_unavailable
  }

  timeouts {
    create = var.create_timeout
    update = var.update_timeout
  }

}


