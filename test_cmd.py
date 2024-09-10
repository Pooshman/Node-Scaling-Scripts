import subprocess

# This is the command you want to test, similar to the one used in the cmd function
cmd = [
    "sbatch", "-A", "your-account", "-p", "queue-1", "--nodes=1", 
    "--ntasks=16", "--time=24:00:00", "echo", "'Test SLURM submission'"
]

# Running the command
try:
    result = subprocess.run(cmd, check=True, capture_output=True, text=True)
    print(f"Command executed successfully: {result.stdout}")
except subprocess.CalledProcessError as e:
    print(f"Command failed: {e.stderr}")
