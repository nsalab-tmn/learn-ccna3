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
  description = "Legacy alias: SSH port of the first simulated device (D1)."
  value       = 22
}

# One SSH port per simulated device: the base port + its topology id (read from
# topology.yaml, so reordering the devices can't silently break grading). Output
# names are static in Terraform: add one block per simulated device.
output "ssh_port_D1" {
  description = "SSH port of D1 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["D1"]
}

output "ssh_port_R1" {
  description = "SSH port of R1 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["R1"]
}

output "ssh_port_R2" {
  description = "SSH port of R2 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["R2"]
}

output "ssh_port_D2" {
  description = "SSH port of D2 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["D2"]
}

output "ssh_port_ASw-1" {
  description = "SSH port of ASw-1 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["ASw-1"]
}

output "ssh_port_ASw-2" {
  description = "SSH port of ASw-2 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["ASw-2"]
}

output "ssh_port_ASw-3" {
  description = "SSH port of ASw-3 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["ASw-3"]
}

output "ssh_port_ASw-4" {
  description = "SSH port of ASw-4 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["ASw-4"]
}

output "ssh_port_ASw-5" {
  description = "SSH port of ASw-5 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["ASw-5"]
}

output "ssh_port_ASw-6" {
  description = "SSH port of ASw-6 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["ASw-6"]
}

output "ssh_port_ASw-7" {
  description = "SSH port of ASw-7 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["ASw-7"]
}

output "ssh_port_PC1" {
  description = "SSH port of PC1 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC1"]
}

output "ssh_port_PC2" {
  description = "SSH port of PC2 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC2"]
}

output "ssh_port_PC3" {
  description = "SSH port of PC3 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC3"]
}

output "ssh_port_PC4" {
  description = "SSH port of PC4 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC4"]
}

output "ssh_port_PC5" {
  description = "SSH port of PC5 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC5"]
}

output "ssh_port_PC6" {
  description = "SSH port of PC6 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC6"]
}

output "ssh_port_PC7" {
  description = "SSH port of PC7 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC7"]
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
