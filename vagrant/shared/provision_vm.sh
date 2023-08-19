#!/bin/bash


scripts=$(ls /vagrant/shared/provision_scripts/*.sh | sort)

echo "SCRIPTS: $scripts"

for script in $scripts; do
  echo "RUNNING $script"
  sudo chmod +x $script
  $script
done
