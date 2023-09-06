# multipass launch --name master -c 2 -m 2G --disk 10G
# multipass launch --name worker -c 2 -m 2G --disk 10G

#!/bin/bash

# Prompt user for the values of -c, -m, and --disk for master node
read -p "Enter the Number of CPUs of Master Node VM: " cpus
read -p "Enter the value for RAM of Master Node VM (in GB): " memory
read -p "Enter the value for Disk Space of Master Node VM (in GB): " disk

# Launch the multipass instance with user-provided values
multipass launch --name masterNode -c "$cpus" -m "$memory"G --disk "$disk"G

# Prompt user for the values of -c, -m, and --disk for master node
read -p "Enter the Number of CPUs of Worker Node VM: " cpus
read -p "Enter the value for RAM of Worker Node VM (in GB): " memory
read -p "Enter the value for Disk Space of Worker Node VM (in GB): " disk

# Launch the multipass instance with user-provided values
multipass launch --name workerNode -c "$cpus" -m "$memory"G --disk "$disk"G
