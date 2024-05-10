#!/bin/bash

# generate keypair for the jumpbox
ssh-keygen -t rsa -N "" -f id_rsa
mkdir -p ~/.ssh
mv id_rsa ~/.ssh
mv id_rsa.pub ~/.ssh

# copy jumpbox public key to other hosts
while read IP FQDN HOST SUBNET; do 
  ssh-copy-id root@${IP}
done < machines.txt

# vertify public key access is working
while read IP FQDN HOST SUBNET; do 
  ssh -n root@${IP} uname -o -m
done < machines.txt
