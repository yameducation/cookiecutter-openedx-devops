#------------------------------------------------------------------------------
# written by: Miguel Afonso
#             https://www.linkedin.com/in/mmafonso/
#
# date: Aug-2021
#
# usage: create all the application secrets
#------------------------------------------------------------------------------
locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  global_vars      = read_terragrunt_config(find_in_parent_folders("global.hcl"))

  environment_namespace = local.environment_vars.locals.environment_namespace
  environment           = local.environment_vars.locals.environment
  resource_name         = local.environment_vars.locals.shared_resource_namespace
  root_domain           = local.global_vars.locals.root_domain
}


dependencies {
  paths = [
    "../../../stacks/{{ cookiecutter.global_platform_shared_resource_identifier }}/vpc",
    "../../../stacks/{{ cookiecutter.global_platform_shared_resource_identifier }}/kubernetes",
    "../kubernetes"
    ]
}

dependency "vpc" {
  config_path = "../../../stacks/{{ cookiecutter.global_platform_shared_resource_identifier }}/vpc"

  # Configure mock outputs for the `validate` and `init` commands that are returned when there are no outputs available (e.g the
  # module hasn't been applied yet.
  mock_outputs_allowed_terraform_commands = ["init", "validate"]
  mock_outputs = {
    vpc_id           = "fake-vpc-id"
    public_subnets   = ["fake-public-subnet-01", "fake-public-subnet-02"]
    private_subnets  = ["fake-private-subnet-01", "fake-private-subnet-02"]
    database_subnets = ["fake-database-subnet-01", "fake-database-subnet-02"]
  }

}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.

terraform {
  source = "../../modules//kubernetes_secrets"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  resource_name = local.resource_name
  environment_namespace     = local.environment_namespace
  root_domain   = local.root_domain
}
