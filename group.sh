#!/bin/sh

sudo groupadd -g 123456 groupe1
sudo groupadd -g 7890 groupe2
sudo useradd -d /home/Alice -u 1001 -s /bin/bash -m Alice
sudo useradd -d /home/Bob -u 1002 -s /bin/bash -m Bob
sudo useradd -d /home/Eve -u 1003 -s /bin/bash -m Eve
sudo adduser Alice groupe1
sudo adduser Bob groupe2
sudo adduser Eve groupe1
sudo adduser Eve groupe2
cat /etc/group

