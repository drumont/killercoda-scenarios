# Step 4: Deployment Rollout and Update

1. Create a Deployment named **webapp** in namespace `dev-project`:
   - Replicas: 3
   - Image: `nginx:1.23`
2. After the Deployment is fully available, update it to image `nginx:1.24` using a rolling update.

Verification checks:
- Deployment exists  
- All replicas run `nginx:1.24`  
