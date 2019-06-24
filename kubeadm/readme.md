Install Kubeadm

Initialise a cluster

```bash
sudo kubeadm init  --apiserver-cert-extra-sans "master.cookingwithazure.com"
```

Install Weavenet network plugin

```bash
#parse the config file
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#deploy weave-net pod network add-on
sysctl net.bridge.bridge-nf-call-iptables=1
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
```
