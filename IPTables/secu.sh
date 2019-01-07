#!/bin/sh

# Vider les tables actuelles
sudo iptables -t filter -F

# Vider les règles personnelles
sudo iptables -t filter -X

#Forbid all connection by default.
sudo iptables -t filter -P INPUT DROP
sudo iptables -t filter -P FORWARD DROP
sudo iptables -t filter -P OUTPUT DROP

# ICMP (Ping)
sudo iptables -t filter -A INPUT -p icmp -j ACCEPT
sudo iptables -t filter -A OUTPUT -p icmp -j ACCEPT

# SSH In
sudo iptables -t filter -A INPUT -p tcp --dport 22 -j DROP

# SSH Out
sudo iptables -t filter -A OUTPUT -p tcp --dport 22 -j DROP
sudo iptables -t filter -A OUTPUT -p tcp --dport 2222 -j DROP


# ---

# Ne pas casser les connexions etablies
sudo iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# Autoriser loopback
sudo iptables -t filter -A INPUT -i lo -j ACCEPT
sudo iptables -t filter -A OUTPUT -o lo -j ACCEPT

# ICMP (Ping)
#iptables -t filter -A INPUT -p icmp -j ACCEPT
sudo iptables -t filter -A OUTPUT -p icmp -j ACCEPT

# ---

# SSH In
sudo iptables -t filter -A INPUT -p tcp --dport 2222 -j ACCEPT

# SSH Out
sudo iptables -t filter -A OUTPUT -p tcp --dport 2222 -j ACCEPT

# HTTP + HTTPS Out
sudo iptables -t filter -A OUTPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -t filter -A OUTPUT -p tcp --dport 443 -j ACCEPT

# HTTP + HTTPS In
sudo iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT

# FTP Out
sudo iptables -t filter -A OUTPUT -p tcp --dport 20:21 -j ACCEPT

# FTP In
sudo modprobe ip_conntrack_ftp # ligne facultative avec les serveurs OVH
sudo iptables -t filter -A INPUT -p tcp --dport 20:21 -j ACCEPT
sudo iptables -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

