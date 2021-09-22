resource "aws_msk_configuration" "config" {
  kafka_versions    = var.kafka_versions
  name              = var.name
  server_properties = var.server_properties
  description       = var.description
}