#!/bin/sh

# Vider les tables actuelles
sudo iptables -t filter -F

# Vider les règles personnelles
sudo iptables -t filter -X

#Forbid all connection by default.
sudo iptables -t filter -P INPUT ACCEPT
sudo iptables -t filter -P FORWARD ACCEPT
sudo iptables -t filter -P OUTPUT ACCEPT

