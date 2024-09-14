#!/bin/bash

# Activate the conda environment with Snakemake
source activate snakemake

# Define the number of nodes and jobs
NODES=5
JOBS=5

# Run Snakemake with SLURM cluster submission
snakemake \
    --executor cluster-generic \
    --cluster-generic-submit-cmd 'sbatch --job-name={rule} --ntasks={threads} --mem={resources.mem} --cpus-per-task={threads} --nodes=1 --output=slurm-%j.out --error=slurm-%j.err' \
    --jobs $JOBS \
    --use-conda \
    --keep-going \
    --latency-wait 60 \
    --resources nodes=$NODES
