#GKE Cluster......................................................................................
resource "google_container_cluster" "cluster" {
  project        = var.project_id
  name           = var.cluster_name
  network        = var.network
  subnetwork     = var.subnetwork
  location       = var.location

  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count       = 1

    vertical_pod_autoscaling {
    enabled = var.vertical_pod_autoscaling
  }


  release_channel {
    channel = var.release_channel
  }

  binary_authorization {
    evaluation_mode = var.enable_binary_authorization
  }

  enable_shielded_nodes       = var.enable_shielded_nodes
  resource_labels             = var.resource_labels
  enable_intranode_visibility = var.enable_intranode_visibility

  private_cluster_config {
    enable_private_endpoint = var.enable_private_endpoint
    enable_private_nodes    = var.enable_private_nodes
  }

  # notification_config {
  #   pubsub {
  #     enabled = var.pubsub_notify
  #     topic   = var.cluster_topic
  #   }
  # }

  logging_service    = var.logging_service
  monitoring_service = var.monitoring_service

  maintenance_policy {
    recurring_window {
      start_time = var.maintenance_start_time
      end_time   = var.maintenance_end_time
      recurrence = var.recurrence
    }
  }

  timeouts {
    create = var.create_timeout
    update = var.update_timeout
  }
  deletion_protection = false

}

