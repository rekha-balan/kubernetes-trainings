#!/bin/bash
saname=$1

kubectl create sa $saname


#works on Mac OS X
server=`kubectl cluster-info | sed $'s,\x1b\\[[0-9;]*[a-zA-Z],,g'| grep master | awk '{print $6}'`

name=`kubectl get secret | grep $saname|awk '{print $1}'`

ca=$(kubectl get secret/$name -o jsonpath='{.data.ca\.crt}')

token=$(kubectl get secret/$name -o jsonpath='{.data.token}' | base64 --decode)

namespace=$(kubectl get secret/$name -o jsonpath='{.data.namespace}' | base64 -D)


echo "
apiVersion: v1
kind: Config
clusters:
- name: default-cluster
  cluster:
    certificate-authority-data: ${ca}
    server: ${server}
contexts:
- name: default-context
  context:
    cluster: default-cluster
    namespace: default
    user: default-user
current-context: default-context
users:
- name: default-user
  user:
    token: ${token}
" > $saname.kubeconfig

#optional
kubectl create clusterrolebinding $saname --clusterrole=cluster-admin --serviceaccount=default:$saname