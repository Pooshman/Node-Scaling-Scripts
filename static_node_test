#!/bin/bash
#SBATCH --job-name=test_static_nodes
#SBATCH --nodes=5          # Request 5 nodes
#SBATCH --ntasks-per-node=1 # 1 task per node (you can increase this depending on the number of cores)
#SBATCH --time=00:10:00     # Set a short duration for the test
#SBATCH --output=output_%j.txt # Output file

echo "Running on nodes:"
srun hostname

# Add your commands here that you want to run on each node
srun sleep 60  # Simulate a workload by sleeping for 60 seconds
