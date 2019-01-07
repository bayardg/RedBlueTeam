#!/bin/sh

sudo apt install openssh-server
sudo rm /etc/ssh/ssh_host_*_key
sudo ssh-keygen -t rsa -b 4096 -f /etc/ssh/safe_host_rsa_key
sudo ssh-keygen -t dsa -b 1024 -f /etc/ssh/safe_host_dsa_key

#On met à jour le fichier /etc/ssh/sshd\_config en remplaçant les deux lignes

# HostKeys for protocol version 2
#HostKey /etc/ssh/ssh_host_rsa_key
#HostKey /etc/ssh/ssh_host_dsa_key
#par les deux lignes
#/etc/ssh/safe_host_rsa_key
#/etc/ssh/safe_host_dsa_key
