# k8s-ignite

## Prerequisites

1. `K8s` cluster / `Minikube` with your local `kubectl` configured for it.
1. Helm installed
1.

## Setup

If helm has not been installed to the cluster before:

```bash
helm init
```

To install:

```bash
helm install --name ignite ./ignite
```

To uninstall:

```bash
helm delete --purge ignite
```
