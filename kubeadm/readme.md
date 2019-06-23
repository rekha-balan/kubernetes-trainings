Install Kubeadm

Initialise a cluster

```bash
sudo kubeadm init  --apiserver-cert-extra-sans "master.cookingwithazure.com"
```

Install Weavenet network plugin

```bash
sysctl net.bridge.bridge-nf-call-iptables=1
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
```
