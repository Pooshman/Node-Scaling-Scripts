#!/bin/bash

# Set SLURM options
#SBATCH --job-name=snakemake_workflow  # Job name
#SBATCH --output=snakemake_%j.log     # Output log file
#SBATCH --error=snakemake_%j.err      # Error log file
#SBATCH --nodes=5                     # Request 5 nodes
#SBATCH --ntasks-per-node=1           # One task per node
#SBATCH --cpus-per-task=1             # One CPU per task
#SBATCH --mem=4G                      # Memory per node
#SBATCH --time=01:00:00               # Time limit (hh:mm:ss)


# Run Snakemake with SLURM executor
snakemake --executor slurm \
          --jobs 5 \
          --use-conda \
          --keep-going \
          --latency-wait 60 \
          --verbose
