#!/bin/bash

# Check PV bound
kubectl get pv | grep -q Bound || exit 1

# Check PVC bound
kubectl get pvc -n dev-project | grep -q Bound || exit 1

# Check pod running
STATUS=$(kubectl get pod pv-pod -n dev-project -o jsonpath='{.status.phase}')
[ "$STATUS" != "Running" ] && exit 1

# Check file content
kubectl exec -n dev-project pv-pod -- cat /usr/share/nginx/html/index.html | grep -q "HelloFromPV" || exit 1

exit 0
