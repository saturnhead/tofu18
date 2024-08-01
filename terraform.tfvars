stacks = {
  tofu18_dev_ec2 = {
    branch                  = "main"
    description             = "Dev EC2 Stack"
    project_root            = "stacks/dev"
    repo                    = "tofu18"
    terraform_workflow_tool = "OPEN_TOFU"
    version                 = "1.8.0"
    labels                  = ["tofu18", "dev"]
  }

  tofu18_qa_ec2 = {
    branch                  = "main"
    description             = "QA EC2 Stack"
    project_root            = "stacks/qa"
    repo                    = "tofu18"
    terraform_workflow_tool = "OPEN_TOFU"
    version                 = "1.8.0"
    labels                  = ["tofu18", "qa"]
  }

  tofu18_stage_ec2 = {
    branch                  = "main"
    description             = "Stage EC2 Stack"
    project_root            = "stacks/stage"
    repo                    = "tofu18"
    terraform_workflow_tool = "OPEN_TOFU"
    version                 = "1.8.0"
    labels                  = ["tofu18", "stage"]
  }

  tofu18_prod_ec2 = {
    branch                  = "main"
    description             = "Prod EC2 Stack"
    project_root            = "stacks/prod"
    repo                    = "tofu18"
    terraform_workflow_tool = "OPEN_TOFU"
    version                 = "1.8.0"
    labels                  = ["tofu18", "qa"]
  }
}


integrations = {
  integration1 = {
    integration_id = "01H79TE7EP3W7K4AMMV447J189"
    stack_name     = "tofu18_dev_ec2"
  }
  integration2 = {
    integration_id = "01H79TE7EP3W7K4AMMV447J189"
    stack_name     = "tofu18_qa_ec2"
  }
  integration3 = {
    integration_id = "01H79TE7EP3W7K4AMMV447J189"
    stack_name     = "tofu18_stage_ec2"
  }
  integration4 = {
    integration_id = "01H79TE7EP3W7K4AMMV447J189"
    stack_name     = "tofu18_prod_ec2"
  }
}

contexts = {
  context_tofu18 = {
    description = "Tofu18 context"
    name        = "Tofu18_context"
  }
}

context_attachments = {
  attachment1 = {
    context_name = "context_tofu18"
    stack_name   = "tofu18_dev_ec2"
    priority     = 0
  }
  attachment2 = {
    context_name = "context_tofu18"
    stack_name   = "tofu18_qa_ec2"
    priority     = 0
  }
  attachment3 = {
    context_name = "context_tofu18"
    stack_name   = "tofu18_stage_ec2"
    priority     = 0
  }
  attachment4 = {
    context_name = "context_tofu18"
    stack_name   = "tofu18_prod_ec2"
    priority     = 0
  }
}

env_vars = {
  module_tag = {
    context_name = "context_tofu18"
    name         = "TF_VAR_module_tag"
    value        = "v0.0.1"
  }
}
