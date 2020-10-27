variable "create" {
  description = "Boolean to create resources or not"
  type        = bool
  default     = true
}

########
# Label
########
variable "name" {
  description = "The name for the label"
  type        = string
  default     = "mattermost"
}

variable "tags" {
  description = "Map of tags"
  type        = map(string)
  default     = {}
}
