# run_snakemake.py

import subprocess

def main():
    # Define Snakemake command
    cmd = [
        "snakemake",
        "--cores", "5",  # Number of cores to use
        "--config", "config/config.yaml",  # Path to the configuration file
        "--use-conda",  # Use Conda for environment management
        "--rerun-incomplete",  # Re-run incomplete jobs
        "--jobs", "10",  # Maximum number of jobs to submit simultaneously
        "--keep-going",  # Continue running other jobs if some fail
        "--latency-wait", "60",  # Time to wait before checking for job completion
        "--cluster-config", "cluster.yaml",  # Path to the cluster configuration file
        "--cluster", "sbatch --nodes={cluster.nodes} --ntasks-per-node={cluster.ntasks-per-node} --time={cluster.time} --partition={cluster.partition}"
    ]
    
    # Run Snakemake command
    subprocess.run(cmd)

if __name__ == "__main__":
    main()
