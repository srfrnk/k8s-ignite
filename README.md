# k8s-ignite

## Prerequisites

1. `K8s` cluster / `Minikube` with your dev machine `kubectl` configured for it.
1. Helm (3.x or later) installed on your dev machine

## Setup

- **Use this step to install a pre-built version.**
- **Skip to next section to build a version from latest sources.**

- Open the [distribution folder](https://github.com/srfrnk/k8s-ignite/blob/master/dist) in your browser.
- Choose a version yaml - e.g. `ignite-minikube-20191221-1508.yaml`

Install by running:

```bash
kubectl apply -f https://raw.githubusercontent.com/srfrnk/k8s-ignite/master/dist/ignite-{{VERSION}}.yaml
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

Activate the cluster:

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
