# Step 1: Create Namespace and RBAC

1. Create a namespace called **dev-project**.
2. Create a ServiceAccount named **dev-sa** inside this namespace.
3. Bind the **edit** ClusterRole to this ServiceAccount so that it can manage deployments only in the *dev-project* namespace.

Verification will check:
- Namespace exists  
- ServiceAccount exists  
- The ServiceAccount has Edit permissions in the namespace  
