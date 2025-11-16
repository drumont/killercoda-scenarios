# Step 2: Scheduling a Pod on a Tainted Node

1. Taint node **worker2** with the following taint:
key=maintenance:NoSchedule

2. Create a Pod named **tolerant-pod** in namespace `dev-project` using image `nginx:alpine`.
3. Add a toleration so the Pod schedules on worker2 despite the taint.

Verification will ensure:
- The node is tainted  
- The Pod exists  
- The Pod is running on **worker2**
