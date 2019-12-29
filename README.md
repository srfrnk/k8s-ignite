# k8s-ignite

## Prerequisites

1. `K8s` cluster / `Minikube` with your dev machine `kubectl` configured for it.
1. Helm (3.x or later) installed on your dev machine
1. Your K8s cluster should have docker access to Github Package

## Docker access to Github Packages

Run (use your Github `Username` and `Personal Access Token` along with your email):

```bash
docker login -u USERNAME -p TOKEN docker.pkg.github.com
```

This will create/add your auth details to `~/.docker/config.json`.
At the setup step you will use this file to create a secret to allow access to the Github Packages docker image repository.

## Setup

- **Use this step to install a pre-built version.**
- **Skip to next section to build a version from latest sources.**

- Open the [distribution folder](https://github.com/srfrnk/k8s-ignite/blob/master/dist) in your browser.
- Choose a version yaml - e.g. `ignite-minikube-20191221-1508.yaml`

Install by running:

```bash
kubectl apply -f https://raw.githubusercontent.com/srfrnk/k8s-ignite/master/dist/ignite-{{VERSION}}.yaml
```

To enable K8s access to Github Packages - run:

```bash
make set-registry-secrets
```

Wait for all workloads to run. Then activate the cluster:

```bash
make activate
```

Remove by running:

```bash
kubectl delete -f https://raw.githubusercontent.com/srfrnk/k8s-ignite/master/dist/ignite-{{VERSION}}.yaml
```

## Build

To build:

```bash
make build
```

## Install

```bash
kubectl apply -f ./dist/ignite-minikube.yaml
```

To enable K8s access to Github Packages - run:

```bash
make set-registry-secrets
```

Wait for all workloads to run. Then activate the cluster:

```bash
make activate
```

Start proxy:

```bash
make start-proxy
```

## Uninstall

```bash
kubectl delete -f ./dist/ignite-minikube.yaml
```
