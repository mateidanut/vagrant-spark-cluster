#!/bin/bash



# List of VM names
vm_names=("node1" "node2")

# Path to the shared provision.sh script
provision_script_path="/vagrant/shared/provision_vm.sh"

for vm_name in "${vm_names[@]}"; do
    echo "Running provision.sh on $vm_name..."

    #vagrant ssh $vm_name -c "echo BEPIS" 2>&1

    vagrant ssh $vm_name -c "bash $provision_script_path" 2>&1
    echo "Provisioning on $vm_name completed."
done

