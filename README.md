# Stay

## _Iaas (Infrastructure architecture as Code)_

[![Terraform](https://upload.wikimedia.org/wikipedia/commons/0/04/Terraform_Logo.svg)](https://www.terraform.io/)

Here is the full code which build a part of infrastructure required for Stay project, Only apps are not managed here but in Applications Continous Deployement Script powered by Github Actions.

- https://github.com/fivekage/stay.front
- https://github.com/fivekage/stay.api

You can find below the architecture designed which represent all resources in Google Cloud Platform.
[![Architecture](http://image.noelshack.com/fichiers/2022/42/6/1666458536-architecture.jpg)]

## Installation

Install Terraform. https://developer.hashicorp.com/terraform/downloads

Some environment vars are required :

```sh
GOOGLE_APPLICATION_CREDENTIALS=<path or content to Google Credentials JSON>
TF_VAR_project_id=<project id>
```

## Get started

```sh
terraform init
terraform plan
terraform apply
```

## Collaborators

- Théo CRAMEZ
- Samy MOKHTARI
