#!/bin/bash

# Check namespace
kubectl get ns dev-project >/dev/null 2>&1 || exit 1

# Check service account
kubectl get sa dev-sa -n dev-project >/dev/null 2>&1 || exit 1

# Check the rolebinding exists
RB=$(kubectl get rolebinding -n dev-project -o name | grep dev-sa 2>/dev/null)
[ -z "$RB" ] && exit 1

# Test permissions: try dry-run deployment as that SA
kubectl auth can-i create deployments -n dev-project --as system:serviceaccount:dev-project:dev-sa | grep -q yes || exit 1

exit 0
