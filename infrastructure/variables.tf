variable "project_id" {
  description = "Google Cloud Platform's project ID where the resources will be created"
  type = string
}

variable "region" {
  description = "Google Cloud Platform's region where the resources will be created"
  type = string
  default = "europe-west1"
}
