#!/bin/bash

sudo bash -c 'echo "net.ipv4.conf.all.forwarding=1" >> /etc/sysctl.conf'; sudo sysctl -p
sudo yum install -y iptables-services; sudo systemctl enable iptables && sudo systemctl start iptables;
sudo iptables -F; sudo iptables -t nat -A POSTROUTING ! -d 192.168.0.0/16 -o eth0 -j MASQUERADE; sudo service iptables save
sudo bash -c 'echo "192.168.0.0/16 via 192.168.255.2 dev eth1" > /etc/sysconfig/network-scripts/route-eth1'; sudo systemctl restart network


