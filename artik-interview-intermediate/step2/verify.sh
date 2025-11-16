#!/bin/bash

# Check taint
kubectl describe node worker2 | grep -q "key=maintenance:NoSchedule" || exit 1

# Check pod running
STATUS=$(kubectl get pod tolerant-pod -n dev-project -o jsonpath='{.status.phase}' 2>/dev/null)
[ "$STATUS" != "Running" ] && exit 1

# Check scheduled on worker2
NODE=$(kubectl get pod tolerant-pod -n dev-project -o jsonpath='{.spec.nodeName}')
[ "$NODE" != "worker2" ] && exit 1

exit 0
