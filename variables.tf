variable "stacks" {
  description = "A map of stack configurations"
  type = map(object({
    branch                  = string
    description             = string
    project_root            = string
    repo                    = string
    terraform_workflow_tool = string
    version                 = string
    labels                  = list(string)
    space_name              = optional(string, "root")
  }))
}

variable "integrations" {
  description = "A map of integration configurations"
  type = map(object({
    integration_id = string
    stack_name     = string
    read           = optional(bool, true)
    write          = optional(bool, true)
  }))
  default = {}
}

variable "contexts" {
  description = "A map of context configurations"
  type = map(object({
    description = string
    name        = string
    before_init = optional(list(string), [])
    space_name  = optional(string, "root")
  }))
  default = {}
}

variable "env_vars" {
  description = "A map of environment variable configurations"
  type = map(object({
    context_name = string
    name         = string
    value        = string
    is_secret    = optional(bool, false)
  }))
  default = {}
}

variable "context_attachments" {
  description = "A map of context attachment configurations"
  type = map(object({
    context_name = string
    stack_name   = string
    priority     = optional(number, 0)
  }))
  default = {}
}
