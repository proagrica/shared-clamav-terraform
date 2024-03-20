# dsg-shared-clamav-terraform

## Overview

ClamAV is a cross-platform antimalware toolkit able to detect many types of malware, including viruses and developed by Cisco Systems (see [Wikipedia](https://en.wikipedia.org/wiki/Clam_AntiVirus))

This Terraform Module is used for provisioning a ClamAV service using an embedded helm chart.

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14.0 |
| helm | >= 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| helm | >= 2.2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| namespace | The kubernetes namespace. | `string` | n/a | yes |
| tags | Tags to apply to all resources. | `map(string)` | `{}` | no |

## Outputs

No output.

<!--- END_TF_DOCS --->

# terraform base template
### base template for a terraform module (sample terraform config files in /examples)

    .
    ├── main.tf                                     # main set of configuration for your module, you can also create other configuration files and organize them however makes sense for your project (see the aws example in /examples)
    ├── locals.tf                                   # contain the local definitions for your module
    ├── variables.tf                                # contain the variable definitions for your module
    ├── data.tf                                     # contain the data definitions for your module
    ├── outputs.tf                                  # contain the output definitions for your module
    ├── providers.tf                                # contain the provider definitions for your module
    ├── versions.tf                                 # contain the version definitions for your providers and terraform  
    ├── *.auto.tfvars or terraform.tfvars           # contain values to populate your variables.tf file        
    └── README.md                                   # contain detailed documentation of your module, including usage, required input variables, outputs, etc
    └── .gitignore                                  # contain files that should not be included in source control
    └── .terraform.lock.hcl                         # dependency lock file that tracks provider dependencies

### always run "terraform fmt" after making changes to maintain consistent styling of terraform code
