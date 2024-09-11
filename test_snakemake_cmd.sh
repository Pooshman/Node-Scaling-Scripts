#!/bin/bash

# Activate Snakemake environment
conda activate snakemake

# Define variables
cores=16
mode="fast"
config_path="config/config.yaml"
num_threads=16

# Snakemake command with SLURM executor plugin
snakemake_cmd=(
    "snakemake"
    "--executor" "slurm"
    "--default-resources" "slurm_account=your-account" "slurm_partition=queue-1"
    "--set-resources" "some_rule:slurm_partition=queue-1"
    "--cores" "$cores"
    "--config" "mode=$mode" "config_path=$config_path" "num_threads=$num_threads"
    "--use-conda"
    "--rerun-incomplete"
    "--jobs" "$cores"  # Maximum jobs to submit at once
    "--keep-going"
    "--latency-wait" "60"
)

# Run Snakemake command
"${snakemake_cmd[@]}"
