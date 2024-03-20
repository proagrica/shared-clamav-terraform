resource "helm_release" "clamav" {
  name             = "clamav"
  namespace        = var.namespace
  create_namespace = true
  chart            = "${path.module}/charts/clamav"
  version          = local.chart_version
  skip_crds        = true

  values = [
    yamlencode(local.chart_values)
  ]

  # used to force update for changes in the chart
  set {
    name  = "chart-hash"
    value = local.chart_hash
  }


}