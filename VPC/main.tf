
data "google_compute_zones" "available" {
    project = var.project_id
}

# Custom VPC
resource "google_compute_network" "vpc_network" {
  name = var.network_vpc
  auto_create_subnetworks = false
  description = "This is a custom VPC for Coding Challenge"
  routing_mode = "GLOBAL"  # ALL routes across subnetwork of the VPC will be advertise across regions. REGIONAL will restrict to region
  project = var.project_id
}

# Public Subnet
resource "google_compute_subnetwork" "public_subnet" {
  name          = "public-subnet-${count.index}"
  ip_cidr_range = "10.10.${count.index}.0/24"
  region        = var.region
  count         = length(data.google_compute_zones.available.names)-var.number  # Decrease the count of the subnet with a number so that the number of subnet less than no of AZs
  network       = google_compute_network.vpc_network.id  
  project = var.project_id
}

# Private Subnet
resource "google_compute_subnetwork" "private_subnet" {
  name          = "private-subnet-${count.index}"
  ip_cidr_range = "10.20.${count.index}.0/24"
  region        = var.region
  count         = length(data.google_compute_zones.available.names)-var.number  # Decrease the count of the subnet with a number so that the number of subnet less than no of AZs
  network       = google_compute_network.vpc_network.id  
  project = var.project_id
  private_ip_google_access = "true"
}

resource "google_compute_subnetwork" "protected_subnet" {
  name          = "protected-subnet-${count.index}"
  ip_cidr_range = "10.30.${count.index}.0/24"
  region        = var.region
  count         = length(data.google_compute_zones.available.names)-var.number  # Decrease the count of the subnet with a number so that the number of subnet less than no of AZs
  network       = google_compute_network.vpc_network.id  
  project = var.project_id
  private_ip_google_access = "true"
}

resource "google_compute_router" "router" {
  name    = "challenge-router"
  project = var.project_id
  region  = var.region
  network = google_compute_network.vpc_network.id  
}

resource "google_compute_router_nat" "advanced-nat" {
  name    = "my-router-nat"
  project = var.project_id
   router = google_compute_router.router.name
   region = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  
  dynamic "subnetwork" {
    for_each = google_compute_subnetwork.private_subnet[*].self_link
    content {
      name = subnetwork.value
      source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    }
  }
}




  

