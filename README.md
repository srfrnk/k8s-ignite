# k8s-ignite

## Prerequisites

1. `K8s` cluster / `Minikube` with your dev machine `kubectl` configured for it.
1. Helm installed on your dev machine

## Setup

If helm (<=2.x) has not been installed to the cluster before:

```bash
helm init --client-only
```

**Helm >=3.x** - No need for any initialization.

To build:

```bash
make build
```

To install:

```bash
helm install --name ignite ./ignite
```

To uninstall:

```bash
helm delete --purge ignite
```
