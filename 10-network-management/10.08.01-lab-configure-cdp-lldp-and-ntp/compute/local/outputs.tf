# These outputs become tf-dynamic-params.json (raw `terraform output` envelope),
# read by learn-assessment. The address is the container's learn-labs IP / DNS name
# — an assessment-reachable address on the shared network, NEVER localhost (the
# grader runs in a sibling container on learn-labs).

output "lab_host" {
  description = "Docker DNS name (= container name) on learn-labs."
  value       = docker_container.lab.name
}

output "lab_ip" {
  description = "Container IP on the learn-labs network (never localhost)."
  value = one([
    for n in docker_container.lab.network_data : n.ip_address
    if n.network_name == "learn-labs"
  ])
}

output "ssh_port" {
  description = "Legacy alias: SSH port of the first simulated device (HQ)."
  value       = 22
}

# One SSH port per simulated device: the base port + its topology id (read from
# topology.yaml, so reordering the devices can't silently break grading). Output
# names are static in Terraform: add one block per simulated device.
output "ssh_port_HQ" {
  description = "SSH port of HQ (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["HQ"]
}

output "ssh_port_Branch" {
  description = "SSH port of Branch (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["Branch"]
}

output "ssh_port_HQ-SW-1" {
  description = "SSH port of HQ-SW-1 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["HQ-SW-1"]
}

output "ssh_port_HQ-SW-2" {
  description = "SSH port of HQ-SW-2 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["HQ-SW-2"]
}

output "ssh_port_NTP-Server" {
  description = "SSH port of NTP-Server (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["NTP-Server"]
}

output "ssh_port_PC1" {
  description = "SSH port of PC1 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC1"]
}

output "ssh_port_BR-SW-1" {
  description = "SSH port of BR-SW-1 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["BR-SW-1"]
}

output "ssh_port_BR-SW-2" {
  description = "SSH port of BR-SW-2 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["BR-SW-2"]
}

output "ssh_port_BR-SW-3" {
  description = "SSH port of BR-SW-3 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["BR-SW-3"]
}

output "ssh_port_PC2" {
  description = "SSH port of PC2 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC2"]
}

output "ssh_port_PC3" {
  description = "SSH port of PC3 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC3"]
}

output "URL" {
  description = "Student web canvas (topology + in-page device console) — the platform edge proxies this to the learner."
  value       = "http://${docker_container.lab.name}:7681/"
}

output "ssh_user" {
  description = "SSH username."
  value       = "admin"
}

output "ssh_password" {
  description = "Per-lab SSH password."
  value       = random_password.ssh.result
  sensitive   = true
}
