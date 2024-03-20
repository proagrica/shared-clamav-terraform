locals {
  chart_version = "0.22.0"
  chart_path    = "${path.module}/charts/clamav"

  # This hash forces Terraform to redeploy if a new template file is added or changed, or values are updated
  chart_hash = sha1(
    join(
      "",
      [
        for f in fileset(local.chart_path, "**/*.yaml") :
        filesha1("${local.chart_path}/${f}")
      ]
    )
  )


  chart_values = {
    nameOverride = "clamav"

    nodeSelector = {
      "kubernetes.io/os" = "linux"
    }

    affinity = {
      podAntiAffinity = {
        preferredDuringSchedulingIgnoredDuringExecution = [
          {
            podAffinityTerm = {
              labelSelector = {
                matchLabels = {
                  "app.kubernetes.io/name"     = "clamav"
                  "app.kubernetes.io/instance" = "clamav"
                }
              }
              topologyKey = "topology.kubernetes.io/zone"
            }
            weight = 100
          },
          {
            podAffinityTerm = {
              labelSelector = {
                matchLabels = {
                  "app.kubernetes.io/name"     = "clamav"
                  "app.kubernetes.io/instance" = "clamav"
                }
              }
              topologyKey = "kubernetes.io/hostname"
            }
            weight = 10
          }
        ]
      }
    }

    podDisruptionBudget = {
      enabled        = true
      maxUnavailable = 1
    }

    autoscaling = {
      enabled                        = true
      minReplicas                    = 1
      maxReplicas                    = 3
      targetCPUUtilizationPercentage = 80
    }

    resources = {
      requests = {
        cpu    = "200m"
        memory = "2048Mi"
      }

      limits = {
        cpu    = "500m"
        memory = "3072Mi"
      }
    }

    yaraRules = [
      {
        name = "officemacros"
        rule = <<-EOT
            rule officemacros
            {
                meta:
                    description = "MS Office document containing a macro"
                    thread_level = 1
                    in_the_wild = true
                strings:
                    $a = {d0 cf 11 e0}
                    $b = {00 41 74 74 72 69 62 75 74 00}
                condition:
                    $a at 0 and $b
            }
          EOT
      }
    ]

    freshclam = {
      enabled = true
      resources = {
        requests = {
          cpu    = "200m"
          memory = "256Mi"
        }

        limits = {
          cpu    = "500m"
          memory = "1024Mi"
        }
      }
    }
  }

}