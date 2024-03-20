variable "namespace" {
  description = "The kubernetes namespace."
  type        = string
}

variable "tags" {
  description = "Tags to apply to all reso urces."
  type        = map(string)
  default     = {}
}
