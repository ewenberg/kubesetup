#!/bin/bash
ssh-keygen -t rsa -N "" -f id_rsa
mkdir -p ~/.ssh
mv id_rsa ~/.ssh
mv id_rsa.pub ~/.ssh


