terraform {
  required_providers {
    # null = {
    #   source  = "hashicorp/null"
    #   version = "3.0.0"
    # }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.3"
    }
  }

  required_version = "~> 1.0"

}
