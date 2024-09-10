#!/bin/bash

# Activate Snakemake environment
conda activate snakemake

# Define variables
cores=16
mode="fast"
config_path="config/config.yaml"
num_threads=16

# Snakemake command
snakemake_cmd=(
    "snakemake"
    "--cores" "$cores"
    "--config" "mode=$mode" "config_path=$config_path" "num_threads=$num_threads"
    "--use-conda"
    "--rerun-incomplete"
    "--jobs" "$cores"  # Maximum jobs to submit at once
    "--keep-going"
    "--latency-wait" "60"
    "--cluster" "sbatch -A your-account -p queue-1 --nodes=1 --ntasks={threads} --time=24:00:00"
)

# Run Snakemake command
"${snakemake_cmd[@]}"

