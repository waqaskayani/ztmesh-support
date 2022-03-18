# Extreme ZTNA: GCP Integration

To restart this tutorial, run this command in the Cloud Shell terminal:

```sh
teachme ~/cloudshell_open/ztmesh-support/quickstart.md
```


## Introduction

In this quickstart, you use Deployment Manager to deploy a Service Account that Extreme ZTNA will use to authenticate againts the specified GCP Project.


## Setting up

1. Select or create a Google Cloud Platform project:

    <walkthrough-project-setup></walkthrough-project-setup>

2. Configure the `gcloud` command-line tool to use your project:

    ```sh
	gcloud config set project {{project-id}}
    ```


## Deploying template

To deploy the template, run these commands:

```sh
cd ~/cloudshell_open/ztmesh-support
gcloud deployment-manager deployments create ztmesh-deployment --config service-account.yaml
```
