# Setup a Kubernetes Cluster using Multipass!

You can use [Multipass](https://multipass.run/) to create two Ubuntu VMs and then set up a Kubernetes cluster on these two VMs.


## Step 1. Install Multipass

```
sudo snap install multipass
```

### Step 2. Create two Ubuntu VMs,

```
git clone https://github.com/pkshahid/multipass-k8s.git
./launch.sh
```

### Step 3. Setup Master Node,

#### 3.1 SSH to Master Node VM

```
./ssh-master.sh
```

#### 3.2 Install Packages and Initialize Master Node.

when in master node VM, execute the following commands

```
sudo -i
git clone https://github.com/pkshahid/multipass-k8s.git
./setup_master.sh
```

#### 3.3 Copy join command

copy the output like this, and prepare to run it in Step 4.3

```
kubeadm join 192.168.64.3:6443 --token al0kvi.x60mi1xj4zesqnq3     --discovery-token-ca-cert-hash sha256:f4ff0c7684bbac599a8208b94bb28e451023662ab51bc1ce16f60a855a85e2a5
```

### Step 4. Setup Worker Node,

#### 4.1 SSH to Worker Node VM.
Open new terminal tab and execute following command
```
./ssh-worker.sh
```

#### 4.2 Install Packages and Initialize Worker Node.
when in worker node VM,execute the following commands

```
sudo -i
git clone https://github.com/pkshahid/multipass-k8s.git
./setup_worker.sh
```

#### 4.3 Join Master Node with Worker Node

Run what you copied from Step 3.3, something like this,

```
kubeadm join 192.168.64.3:6443 --token al0kvi.x60mi1xj4zesqnq3     --discovery-token-ca-cert-hash sha256:f4ff0c7684bbac599a8208b94bb28e451023662ab51bc1ce16f60a855a85e2a5
```

### Step 5. Verify Nodes and Pods and deploy an image

SSH to master node and run following commands,

```
# To verify Nodes,

kubectl get nodes

# Response will be something similar to this,

# NAME         STATUS   ROLES    AGE   VERSION
# master       Ready    master   34h   v1.19.0
# worker       Ready    <none>   34h   v1.19.0

# To Run an Nginx Image in pods

kubectl run nginx --image=nginx
#pod/nginx created

# To Show Created Pod

kubectl get pod
# NAME    READY   STATUS    RESTARTS   AGE
# nginx   1/1     Running   0          19s
```

### Step 6. Delete two Ubuntu VMs,

After you complete practice, you can delete the VMs. Assume you are still on the same directory as Step 2.

```
./destroy.sh
```

