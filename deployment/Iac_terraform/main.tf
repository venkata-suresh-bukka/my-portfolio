#Module_vpc_network
module "custom-network" {
  source                  = "./modules/network/"
  vpc                     = var.vpc
  auto_create_subnetworks = var.auto_create_subnetworks
  subnets                 = var.subnets
  subnet_regions          = var.subnet_regions
  cidr_range              = var.cidr_range
  source_ranges           = var.source_ranges
  protocol                = var.protocol
  ports                   = var.ports
  firewall                = var.firewall
  aggregation_interval    = var.aggregation_interval
  flow_sampling           = var.flow_sampling
  subnet_metadata         = var.subnet_metadata
  firewall_metadata       = var.firewall_metadata
  source_tags             = var.source_tags
  target_tags             = var.target_tags
  # target_service_accounts = var.target_service_accounts
}

#Module_Pubsub
# module "notify" {
#   source       = "./modules/pubsub"
#   project_id   = var.project_id
#   pubsub_topic = var.pubsub_topic

# }

#Module_Cluster
module "cluster" {
  source = "./modules/gke/cluster"
  # depends_on = [
  #   module.notify, module.custom-network
  # ]
  project_id   = var.project_id
  cluster_name = var.cluster_name
  network      = module.custom-network.network
  subnetwork   = module.custom-network.subnet
  location     = var.location
  # node_locations                = var.node_locations
  remove_default_node_pool = var.remove_default_node_pool
  vertical_pod_autoscaling = var.vertical_pod_autoscaling
  # cluster_secondary_range_name  = var.cluster_secondary_range_name
  # services_secondary_range_name = var.services_secondary_range_name
  release_channel             = var.release_channel
  enable_binary_authorization = var.enable_binary_authorization
  enable_shielded_nodes       = var.enable_shielded_nodes
  enable_intranode_visibility = var.enable_intranode_visibility
  enable_private_endpoint     = var.enable_private_endpoint
  enable_private_nodes        = var.enable_private_nodes
  # pubsub_notify               = var.pubsub_notify
  logging_service             = var.logging_service
  monitoring_service          = var.monitoring_service
  maintenance_start_time      = var.maintenance_start_time
  maintenance_end_time        = var.maintenance_end_time
  recurrence                  = var.recurrence
  create_timeout              = var.create_timeout
  update_timeout              = var.update_timeout
}

#Node-Pool
module "node-pool" {
  source = "./modules/gke/node-pool"
  depends_on = [
    module.cluster, module.custom-network
  ]
  project_id = var.project_id
  node_pool  = var.node_pool
  location   = module.cluster.cluster-location
  cluster    = module.cluster.cluster
  # node_locations              = var.node_locations
  initial_node_count          = var.initial_node_count
  min_node_count              = var.min_node_count
  max_node_count              = var.max_node_count
  auto_repair                 = var.auto_repair
  auto_upgrade                = var.auto_upgrade
  node_machine_type           = var.node_machine_type
  node_image_type             = var.node_image_type
  preemptible                 = var.preemptible
  disk_size_gb                = var.disk_size_gb
  disk_type                   = var.disk_type
  service_account             = var.service_account
  target_tags                 = var.target_tags
  enable_secure_boot          = var.enable_secure_boot
  enable_integrity_monitoring = var.enable_integrity_monitoring
  upgrade_stratergy           = var.upgrade_stratergy
  max_surge                   = var.max_surge
  max_unavailable             = var.max_unavailable
  create_timeout              = var.create_timeout
  update_timeout              = var.update_timeout

}