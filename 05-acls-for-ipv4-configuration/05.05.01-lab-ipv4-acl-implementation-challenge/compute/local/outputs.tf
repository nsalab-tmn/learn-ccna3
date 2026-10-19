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

output "ssh_port_ISP" {
  description = "SSH port of ISP (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["ISP"]
}

output "ssh_port_HQ-S1" {
  description = "SSH port of HQ-S1 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["HQ-S1"]
}

output "ssh_port_PC-1" {
  description = "SSH port of PC-1 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC-1"]
}

output "ssh_port_PC-2" {
  description = "SSH port of PC-2 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC-2"]
}

output "ssh_port_PC-3" {
  description = "SSH port of PC-3 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC-3"]
}

output "ssh_port_HQ-S2" {
  description = "SSH port of HQ-S2 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["HQ-S2"]
}

output "ssh_port_Admin" {
  description = "SSH port of Admin (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["Admin"]
}

output "ssh_port_Enterprise-Web-Server" {
  description = "SSH port of Enterprise-Web-Server (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["Enterprise-Web-Server"]
}

output "ssh_port_BR-S3" {
  description = "SSH port of BR-S3 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["BR-S3"]
}

output "ssh_port_Branch-PC" {
  description = "SSH port of Branch-PC (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["Branch-PC"]
}

output "ssh_port_BR-S4" {
  description = "SSH port of BR-S4 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["BR-S4"]
}

output "ssh_port_Branch-Server" {
  description = "SSH port of Branch-Server (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["Branch-Server"]
}

output "ssh_port_ISP-S1" {
  description = "SSH port of ISP-S1 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["ISP-S1"]
}

output "ssh_port_Internet-User" {
  description = "SSH port of Internet-User (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["Internet-User"]
}

output "ssh_port_ISP-S2" {
  description = "SSH port of ISP-S2 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["ISP-S2"]
}

output "ssh_port_External-Web-Server" {
  description = "SSH port of External-Web-Server (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["External-Web-Server"]
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
