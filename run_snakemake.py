import subprocess

# Define Snakemake command
cmd = [
    "snakemake",
    "--cores", "16",  # Total number of cores to use
    "--jobs", "5",    # Number of jobs to submit at once
    "--config", "mode=fast",  # Example configuration parameter
    "--use-conda",
    "--rerun-incomplete",
    "--keep-going",
    "--latency-wait", "60",
    "--cluster", "sbatch -A your-account -p queue-1 --nodes={nodes} --ntasks-per-node={ntasks-per-node} --time={time}"
]

# Run Snakemake command
subprocess.run(cmd, check=True)
