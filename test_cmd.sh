#!/bin/bash
#SBATCH --job-name=test_cmd    # Job name
#SBATCH --ntasks=1             # Number of tasks (processes)
#SBATCH --cpus-per-task=16     # Number of CPU cores per task
#SBATCH --time=24:00:00        # Walltime
#SBATCH --partition=queue-1    # SLURM partition to use
#SBATCH --nodes=1              # Number of nodes
#SBATCH --output=test_output.txt  # Output file

# Command to test the `cmd` function
python workflow/scripts/noconverge.py --cores 16 --mode fast --config config/config.yaml
