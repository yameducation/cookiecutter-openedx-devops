# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [1.0.5] (2022-12-11)
- bump to K8s 1.24
- version bumps to all Terraform AWS modules https://registry.terraform.io/namespaces/terraform-aws-modules
- version bumps to all Open edX Github Actions https://github.com/openedx-actions
- refactor cert-manager for v1.9


## [1.0.4] (2022-09-02)

- bump to nutmeg.2
- bump tutor to 14.0.5
- tie optional repo build & deployment features to new Y/N flags in Cookiecutter
- add docker ce and python3 to bastion install.sh script
- add installed application versions to bastion login screen

## [1.0.3] (2022-08-29)

- add an option to create a remote MongoDB server running on a standalone EC2 instance.

## [1.0.2] (2022-08-18)

- reconfigure k8s node groups to use [AWS SPOT Pricing](https://aws.amazon.com/ec2/spot/pricing/) for EC2 instances
- add k8s [metrics-server](https://github.com/kubernetes-sigs/metrics-server)
- add [Prometheus](https://prometheus.io/)
- add [Grafana](https://grafana.com/)
- add [Karpenter](https://karpenter.sh/)
- add k8s [Horizontal Pod Autoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) for all Open edX pods
- add k8s [Vertical Pod Autoscaling](https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler) for all Open edX pods
- add AWS S3 encrypted bucket to store e-commerce payment processor api keys and secrets


## [1.0.1] (2022-06-26)

- add per-environment mysql db names
- add openedx-actions/tutor-plugin-configure-courseware-mfe
- add openedx-actions/tutor-plugin-enable-k8s-deploy-tasks
- misc security patches
- add a bastion setup script to install tutor, kubectl, terraform, terragrunt
- bump most openedx-actions to production
- enhanced k8s administration documentation

## [1.0.0] (2022-06-16)

General production release
## [0.2.0] (2022-06-10)

- refactor for tutor 14.x
- bump to open-release/nutmeg.1

## [0.1.4] (2022-06-06)

- Refactor Github workflows to use [openedx-actions](https://github.com/openedx-actions)

## [0.1.3] (2022-05-30)

- bump all Terraform versions

## [0.1.1] (2022-05-26)

- Adds the plugin installation
- adds Terraform code to create a dedicated private S3 bucket for backups

## [0.1.0] (2022-05-24)

- Terraform
  - bumped all version
- Deployment workflow
  - bumped all versions
  - Added installation options for Credentials, Ecommerce, MFE, Discovery, Notes, Forum, Xqueue
- Stacks
  - Introduced shared infrastructure stacks consisting of a private VPC, EKS K8S and an option EC2 Bastion. This collection of resources is configured to host external non-openedx platforms such as for example, your custom micro services or a content management system.
- AWS Services
  - Bastion: full Bastion management including creation and storage of ssh key
  - K8s:  added a namespace for shared secrets: Bastion ssh key, MySQL root credentials
  - RDS: Added storage auto-scaling
  - Mongo: reverted to Tutor-installed MongoDB pod on k8s

## [0.0.5]

- removed subdomains list

## [0.0.4]

- parameterized deployment yaml manifests with cookiecutter
- refactored VPC and EKS modules based on the current latest version of terraform-aws-modules modules
- upgraded AWS RDS Terraform module to v4
- added AWS certficates in us-east-1 and the aws region specified in environments/global.hcl
- added new module for Cloudfront distribution and DNS record for 'cdn' subdomain
- added new optional module for EC2 Bastion and DNS record for subdomain
- added version constraint parameters to cookiecutter for all terraform-aws-modules
- added mock outputs to terragrunt scripts to facilitate `run-all` init and validate operations in environments
- added this change log
- resolved deprecation warnings in all modules
- restructured terraform folders
- fixed a bug that was causing multiple SSL/TLS certificates to be created in both us-east-1 as well as the environment region
- added the text 'openedx_devops' to the descriptions of all security groups, IAM roles, and IAM policies resources that are explicitly created by this repository


## [0.0.3] - 2022-03-20

- added Cookiecutter parameters for environment_subdomain, ci_build_open_edx_version, ci_build_tutor_version, all teraform version constraints
- split environment_name and environment_subdomain
- added Cookiecutter post hook to process selection of EKS Load Balancer configuration
- added scripts to make, test, lint
- more sensible defaults in cookiecutter.json
- expanded README.md documentation
- added git pre-commit
- added AUTHORS.md

## [0.0.2] - 2022-03-11

- Additional documentation

## [0.0.1] - 2022-03-10

Initial release
