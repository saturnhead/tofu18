provider "spacelift" {}

terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}

resource "spacelift_stack" "this" {
  for_each                = var.stacks
  branch                  = each.value.branch
  description             = each.value.description
  name                    = each.key
  project_root            = each.value.project_root
  repository              = each.value.repo
  terraform_workflow_tool = each.value.terraform_workflow_tool
  terraform_version       = each.value.version
  labels                  = each.value.labels
  space_id                = each.value.space_name
}

resource "spacelift_aws_integration_attachment" "integration" {
  for_each       = var.integrations
  integration_id = each.value.integration_id
  stack_id       = spacelift_stack.this[each.value.stack_name].id
  read           = each.value.read
  write          = each.value.write
}

resource "spacelift_context" "this" {
  for_each    = var.contexts
  description = each.value.description
  name        = each.value.name
  before_init = each.value.before_init
  space_id    = each.value.space_name
}

resource "spacelift_environment_variable" "this" {
  for_each   = var.env_vars
  context_id = spacelift_context.this[each.value.context_name].id
  name       = each.value.name
  value      = each.value.value
  write_only = each.value.is_secret
}


resource "spacelift_context_attachment" "this" {
  for_each   = var.context_attachments
  context_id = spacelift_context.this[each.value.context_name].id
  stack_id   = spacelift_stack.this[each.value.stack_name].id
  priority   = each.value.priority
}
