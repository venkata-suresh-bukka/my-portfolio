# credentials = file("F:/resume/projects/lateral-berm.json")
project_id  = "lateral-berm-440713-p6"

#VPC Network:
vpc                     = ["gke-vpc"] 
auto_create_subnetworks = "false"

#Subnets:
subnets              = ["gke-subnet"]
subnet_regions       = ["us-central1"]
cidr_range           = ["10.0.0.0/24"]
aggregation_interval = "INTERVAL_10_MIN"
flow_sampling        = 0.5
subnet_metadata      = "INCLUDE_ALL_METADATA"

#Firewall:
firewall          = ["gke-cluster-uscentral1-01"]
source_ranges     = ["0.0.0.0/0"]
protocol          = "tcp"
ports             = ["22","443","3000","80"]
firewall_metadata = "INCLUDE_ALL_METADATA"
source_tags       = ["cluster"]
target_tags       = ["cluster"]
# target_service_accounts = "Add the target service account name"

#Cluster:
cluster_name             = "gke-cluster-uscentral1-01"
location                 = "us-central1-a"
remove_default_node_pool = true
vertical_pod_autoscaling = true
# cluster_secondary_range_name  = "cluster-range"
# services_secondary_range_name = "services-range"
release_channel             = "RAPID"
enable_binary_authorization = "DISABLED"
enable_shielded_nodes       = false
enable_intranode_visibility = false
enable_private_endpoint     = false
enable_private_nodes        = false
#master_ipv4_cidr_block       = "value"
# pubsub_notify          = true
# cluster_topic          = "projects/lateral-berm-440713-p6/topics/gke-topic-cluster-01"
logging_service        = "logging.googleapis.com/kubernetes"
monitoring_service     = "monitoring.googleapis.com/kubernetes"
maintenance_start_time = "2024-07-24T02:00:00Z"
maintenance_end_time   = "2024-07-25T06:00:00Z"
recurrence             = "FREQ=DAILY"
create_timeout         = "40m"
update_timeout         = "40m"

#Node_pool:
node_pool = "gke-node-pool-uscentral-01"
# node-pool-name-2    = "node-pool-windows"
# node_locations     = ["us-central1-a"]
initial_node_count = 1
min_node_count     = 1
max_node_count     = 1
auto_repair        = true
auto_upgrade       = true
node_machine_type  = "e2-small"
# node_machine_type-1 = "e2-standard-4"
node_image_type = "UBUNTU_CONTAINERD" 
# node_image_type-1  = "WINDOWS_LTSC_CONTAINERD"
preemptible     = false
disk_size_gb    = "10"
disk_type       = "pd-standard"
service_account = "gke-usecase@lateral-berm-440713-p6.iam.gserviceaccount.com" //..............To be Replaced
labels = {
  "mylabel" = "gkedr"
}
enable_secure_boot          = false
enable_integrity_monitoring = false
upgrade_stratergy           = "SURGE"
max_surge                   = "1"
max_unavailable             = "1"

#PubSub:
# pubsub_topic = "gke-topic-cluster-01"

