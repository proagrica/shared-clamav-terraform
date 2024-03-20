terraform {
  required_version = ">= 0.14.0"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.2.0"
    }
  }

}