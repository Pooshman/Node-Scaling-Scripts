#!/bin/bash
#SBATCH --job-name=snakemake_job
#SBATCH --nodes=5                # Request 5 nodes
#SBATCH --ntasks-per-node=1      # 1 task per node
#SBATCH --cpus-per-task=4        # Number of CPUs per task
#SBATCH --time=01:00:00          # Time limit (e.g., 1 hour)
#SBATCH --output=snakemake_output_%j.txt  # Output file

# Load necessary modules or activate your environment
# module load snakemake (if needed)
# source activate your_env (if needed)

# Run Snakemake with SLURM as the scheduler
snakemake --snakefile Snakefile --jobs 100 --cluster "sbatch --cpus-per-task={threads} --mem={resources.mem_mb} --time={resources.time}" --cluster-config cluster.yaml
