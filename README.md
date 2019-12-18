# k8s-ignite

## Prerequisites

1. `K8s` cluster / `Minikube` with your dev machine `kubectl` configured for it.
1. Helm (3.x or later) installed on your dev machine

## Setup

## Build

To build:

```bash
make build
```

## Install

```bash
kubectl apply -f ./dist/ignite-{{VERSION}}.yaml
```

Or:

```bash
kubectl apply -f https://raw.githubusercontent.com/srfrnk/k8s-ignite/master/dist/ignite-{{VERSION}}.yaml
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
kubectl delete -f ./dist/ignite-{{VERSION}}.yaml
```

Or:

```bash
kubectl delete -f https://raw.githubusercontent.com/srfrnk/k8s-ignite/master/dist/ignite-{{VERSION}}.yaml
```
