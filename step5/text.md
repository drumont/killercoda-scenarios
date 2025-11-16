# Step 5: Network Policy

1. In namespace `dev-project`, create a NetworkPolicy named **backend-allow-frontend** that:
   - Allows ingress on port 80
   - Only from pods with label `role=frontend`

2. Create a Deployment named **backend** using image `hashicorp/http-echo` with:
--text="backend"

Expose it as a ClusterIP service on port 80.

3. Create a Pod named **frontend** with label `role=frontend` that can successfully curl the backend service.

4. Create another Pod named **rogue** WITHOUT the label and verify it cannot curl the backend.

Verification ensures:
- NetworkPolicy exists  
- frontend → backend works  
- rogue → backend is blocked  
