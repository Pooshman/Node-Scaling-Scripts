#!/bin/bash
#SBATCH --job-name=snakemake_job
#SBATCH --nodes=5
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=01:00:00
#SBATCH --output=snakemake_output_%j.txt

# Activate your Snakemake environment
#conda activate snakemake

# Change to the directory where the Snakefile is located
#cd (Snakefile directory)

#NOTE: The activate and cd commands could be implemented downline for streamlining (auto commands). 
#Also add miniforge3 miniconda3 installation commands

# Run Snakemake with the SLURM profile
snakemake --snakefile Snakefile --jobs 100 --profile config/slurm
