#!/bin/bash

# Validate deployment exists
kubectl get deploy webapp -n dev-project >/dev/null 2>&1 || exit 1

# Check replicas updated
COUNT=$(kubectl get pods -n dev-project -l app=webapp -o jsonpath='{range .items[*]}{.spec.containers[0].image}{"\n"}{end}' | grep -c "nginx:1.24")
[ "$COUNT" -lt 3 ] && exit 1

exit 0
