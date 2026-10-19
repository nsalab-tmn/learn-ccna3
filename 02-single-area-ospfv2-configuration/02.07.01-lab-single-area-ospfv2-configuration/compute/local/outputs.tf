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
  description = "Legacy alias: SSH port of the first simulated device (P2P-1)."
  value       = 22
}

# One SSH port per simulated device: the base port + its topology id (read from
# topology.yaml, so reordering the devices can't silently break grading). Output
# names are static in Terraform: add one block per simulated device.
output "ssh_port_P2P-1" {
  description = "SSH port of P2P-1 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["P2P-1"]
}

output "ssh_port_P2P-2" {
  description = "SSH port of P2P-2 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["P2P-2"]
}

output "ssh_port_P2P-3" {
  description = "SSH port of P2P-3 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["P2P-3"]
}

output "ssh_port_BC-1" {
  description = "SSH port of BC-1 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["BC-1"]
}

output "ssh_port_BC-2" {
  description = "SSH port of BC-2 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["BC-2"]
}

output "ssh_port_BC-3" {
  description = "SSH port of BC-3 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["BC-3"]
}

output "ssh_port_ISP" {
  description = "SSH port of ISP (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["ISP"]
}

output "ssh_port_BC-SW" {
  description = "SSH port of BC-SW (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["BC-SW"]
}

output "ssh_port_HQ-SW1" {
  description = "SSH port of HQ-SW1 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["HQ-SW1"]
}

output "ssh_port_HQ-SW2" {
  description = "SSH port of HQ-SW2 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["HQ-SW2"]
}

output "ssh_port_HQ-SW3" {
  description = "SSH port of HQ-SW3 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["HQ-SW3"]
}

output "ssh_port_DS-SW2" {
  description = "SSH port of DS-SW2 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["DS-SW2"]
}

output "ssh_port_DS-SW3" {
  description = "SSH port of DS-SW3 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["DS-SW3"]
}

output "ssh_port_Internet-Server" {
  description = "SSH port of Internet-Server (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["Internet-Server"]
}

output "ssh_port_PC-1" {
  description = "SSH port of PC-1 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC-1"]
}

output "ssh_port_Laptop-1" {
  description = "SSH port of Laptop-1 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["Laptop-1"]
}

output "ssh_port_Workgroup-Server" {
  description = "SSH port of Workgroup-Server (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["Workgroup-Server"]
}

output "ssh_port_PC-2" {
  description = "SSH port of PC-2 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC-2"]
}

output "ssh_port_PC-3" {
  description = "SSH port of PC-3 (ssh_base_port + its topology id)."
  value       = local.ssh_base_port + local.device_ids["PC-3"]
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
