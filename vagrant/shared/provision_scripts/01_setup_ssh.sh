#!/bin/bash

sudo apt update
sudo apt install sshpass


# Ensure the key exists, if not, generate it
if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
fi

# Copy the key from the current machine to node1 and node2
sshpass -p "vagrant" ssh-copy-id -o StrictHostKeyChecking=no -i $HOME/.ssh/id_rsa.pub "vagrant@node1"
sshpass -p "vagrant" ssh-copy-id -o StrictHostKeyChecking=no -i $HOME/.ssh/id_rsa.pub "vagrant@node2"
