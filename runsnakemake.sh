#!/bin/bash
#SBATCH --job-name=snakemake_job
#SBATCH --nodes=5
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=00:10:00
#SBATCH --output=snakemake_output_%j.txt

# Activate your Snakemake environment

# Run Snakemake (no profile needed)
snakemake --snakefile Snakefile --jobs 100


