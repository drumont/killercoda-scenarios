#!/bin/bash

# Check NetworkPolicy
kubectl get netpol backend-allow-frontend -n dev-project >/dev/null 2>&1 || exit 1

# Test allowed frontend pod
kubectl exec -n dev-project frontend -- curl -s http://backend || exit 1

# Test blocked rogue pod (curl must fail)
kubectl exec -n dev-project rogue -- curl -s --max-time 2 http://backend >/tmp/res 2>&1
grep -q "backend" /tmp/res && exit 1

exit 0
