#!/bin/bash

# Set variables
cores=16
mode="fast"
config_path="config/config.yaml"
num_threads=16

# Snakemake command to test
snakemake \
    --cores $cores \
    --config mode=$mode config_path=$config_path num_threads=$num_threads \
    --use-conda \
    --rerun-incomplete \
    --cluster-config cluster.yaml \
    --jobs $cores \
    --keep-going \
    --latency-wait 60 \
    --cluster "sbatch -A your-account -p queue-1 --nodes=1 --ntasks=${num_threads} --time=24:00:00"
