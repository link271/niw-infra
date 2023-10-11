# NIW Infra

## Description

Terraform is a IaC (infrastructure as code) tool to automate provisoning of
infrastructure. Including AWS, GCP or even Datadog.

In the nutshell, it is a markup language that translates to API calls to cloud
providers to create/update/delete cloud resources. It relies on something called
statefile to know what is the current state of the cloud resources that it is
managing. There are 3 building blocks in Terraform, the markup language, the CLI
tool and the statefile. We can use AWS as the statefile storage for Terraform
(S3 and DynamoDB), this requires setting up an CICD pipeline to run Terraform,
however, to get started quickly, we can use Terraform Cloud.

Terraform's lifecycle is consisted of 3 main phases: 

* init: Initialise terraform by setting up a state storage or connect to
an existing state storage. This step also including downloading terraform
providers and modules if required.
* plan: Run the current Terraform code against the current state to 
determine a plan to create/update/delete resources.
* apply: Execute the current plan to actually carry out provisioning of 
cloud resources.

We will use this project to manage NIW cloud resources. Each project should have
their own Terraform project for isolation purposes. It is also prefferable to
manage many small state over a big one as complex state can lead to dependecies
of resources which can be hard to manage.

## Setup

### Local

`./bin/terraform -chdir=./envs/dev init`

### Remote

- [Terraform Cloud](https://app.terraform.io/app)