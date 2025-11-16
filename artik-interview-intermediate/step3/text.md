# Step 3: Persistent Volume + PVC

1. Create a **1Gi PersistentVolume** (hostPath is allowed).
2. Create a **1Gi PersistentVolumeClaim** in namespace `dev-project`.
3. Deploy a Pod named **pv-pod** using image `nginx:alpine` that mounts the PVC at:
/usr/share/nginx/html


4. Inside the Pod, create a file `/usr/share/nginx/html/index.html` containing:
HelloFromPV


Verification will check:
- PV and PVC are bound  
- Pod is running  
- The mounted file contains the text  
