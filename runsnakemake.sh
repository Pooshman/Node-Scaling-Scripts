#!/bin/bash
#SBATCH --job-name=snakemake_job
#SBATCH --nodes=5
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=01:00:00
#SBATCH --output=snakemake_output_%j.txt

# Activate your Snakemake environment
source activate your_snakemake_env

# Change to the directory where the Snakefile is located
cd /path/to/your/snakemake/workflow

# Run Snakemake with the SLURM profile
snakemake --snakefile Snakefile --jobs 100 --profile config/slurm
