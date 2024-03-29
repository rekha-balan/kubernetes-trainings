#digitalocean for lfs458 


#Download doctl from https://github.com/digitalocean/doctl/releases

#create an API token on Digital Ocean (under Manage->API)

#login with doctl
doctl auth init

#get sizes
doctl compute size list

#get regions
doctl compute region list

#get images
doctl compute image list --public | grep Ubuntu

#import your SSH key
doctl compute ssh-key import  --public-key-file /Users/alessandro/.ssh/do.pub do

#create droplets
doctl compute droplet create --image ubuntu-18-04-x64 --enable-backups --ssh-keys 24877528 --region ams3 --size s-2vcpu-4gb master

doctl compute droplet create --image ubuntu-18-04-x64 --enable-backups --ssh-keys 24877528 --region ams3 --size s-4vcpu-8gb node1

doctl compute droplet create --image ubuntu-18-04-x64 --enable-backups --ssh-keys 24877528 --region ams3 --size s-4vcpu-8gb node2
