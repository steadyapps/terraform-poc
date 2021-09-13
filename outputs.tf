output "zookeeper_connect_string" {
  description = "Plaintext zookeeper host:port pairs"
  value = module.msk-main.zookeeper_connect_string
}

output "bootstrap_brokers" {
  description = "Plaintext connection host:port pairs"
  value       = module.msk-main.bootstrap_brokers
}

output "bootstrap_brokers_tls" {
  description = "TLS connection host:port pairs"
  value       = module.msk-main.bootstrap_brokers_tls
}