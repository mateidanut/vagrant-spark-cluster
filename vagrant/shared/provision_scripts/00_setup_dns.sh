#!/bin/bash

echo "192.168.56.9 node1" | sudo tee -a /etc/hosts
echo "192.168.56.10 node2" | sudo tee -a /etc/hosts
echo "192.168.56.11 node3" | sudo tee -a /etc/hosts
