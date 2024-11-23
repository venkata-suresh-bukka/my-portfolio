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

#Cluster:
cluster_name             = "gke-cluster-uscentral1-01"
location                 = "us-central1-a"
remove_default_node_pool = true
vertical_pod_autoscaling = true
release_channel             = "RAPID"
enable_binary_authorization = "DISABLED"
enable_shielded_nodes       = false
enable_intranode_visibility = false
enable_private_endpoint     = false
enable_private_nodes        = false
logging_service        = "logging.googleapis.com/kubernetes"
monitoring_service     = "monitoring.googleapis.com/kubernetes"
maintenance_start_time = "2024-07-24T02:00:00Z"
maintenance_end_time   = "2024-07-25T06:00:00Z"
recurrence             = "FREQ=DAILY"
create_timeout         = "40m"
update_timeout         = "40m"

#Node_pool:
node_pool = "gke-node-pool-uscentral-01"
initial_node_count = 1
min_node_count     = 1
max_node_count     = 1
auto_repair        = true
auto_upgrade       = true
node_machine_type  = "e2-small"
node_image_type = "UBUNTU_CONTAINERD" 
preemptible     = false
disk_size_gb    = "30"
disk_type       = "pd-standard"
service_account = "gke-task@lateral-berm-440713-p6.iam.gserviceaccount.com" //..............replace with actual account name
labels = {
  "mylabel" = "gkedr"
}
enable_secure_boot          = false
enable_integrity_monitoring = false
upgrade_stratergy           = "SURGE"
max_surge                   = "1"
max_unavailable             = "1"



