


#azure kubeadm

az group create -n kubeadm

az vm create --image UbuntuLTS -g kubeadm -n master --admin-username kubeadm --size Standard_B4ms --custom-data ~/Desktop/prereq_kubeadm.sh --no-wait
az vm create --image UbuntuLTS -g kubeadm -n node1 --admin-username kubeadm --size Standard_B4ms --custom-data ~/Desktop/prereq_kubeadm.sh --no-wait
az vm create --image UbuntuLTS -g kubeadm -n node2 --admin-username kubeadm --size Standard_B4ms --custom-data ~/Desktop/prereq_kubeadm.sh --no-wait


az network dns record-set a add-record -g dns -z cookingwithazure.com -n master -a 40.115.5.23

az network dns record-set a add-record -g dns -z cookingwithazure.com -n node1 -a 40.115.5.23

az network dns record-set a add-record -g dns -z cookingwithazure.com -n node2 -a 40.115.5.23


az network nsg rule create -g kubeadm --nsg-name masterNSG --destination-port-ranges 6443 --priority 100  -n kubeAPI