variable "name" {
  type = string
}

variable "kafka_versions" {
  type = list(string)
}

variable "server_properties" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}