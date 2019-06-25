##Install Kubeadm

Run the script [prereq_kubeadm_master.sh](https://raw.githubusercontent.com/ams0/kubernetes-trainings/master/kubeadm/prereq_kubeadm_master.sh).

###Initialise a cluster

```bash
sudo kubeadm init  --apiserver-cert-extra-sans "master.cookingwithazure.com"
```

If you missed the join command, you can create another one:

```
sudo kubeadm token create --print-join-command
```

```
kubectl describe nodes | grep Taints
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

Start over

```
sudo kubeadm reset -f --skip-phases preflight
sudo rm -R /var/lib/etcd
```
