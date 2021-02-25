#!/bin/bash

# This script should be executed on Linux Ubuntu Virtual Machine

S=$(server)
DATA_DIRECTORY=${2:-/data}

echo "Updating packages"
apt-get -y update

if grep $S /etc/hosts 

then echo "Installing NFS kernel server"
apt-get -y install nfs-kernel-server
sudo systemctl enable nfs-server
echo "Appending localhost to exports configuration file"
echo "/data 192.168.100.0/24(rw,async,insecure,fsid=0,crossmnt,no_subtree_check)" >> /etc/exports

else echo "Installing NFS kernel client"
apt-get -y install nfs-common

fi

echo "Making data directory ${DATA_DIRECTORY}"
mkdir -p ${DATA_DIRECTORY}

nohup service nfs-kernel-server restart



