# Snakefile to parallelize jobs across 5 nodes

# Define the number of threads for parallel jobs (you can adjust this as needed)
threads: 1

# Rule to define all output files expected
rule all:
    input:
        expand("output_file_{i}.txt", i=range(1, 6))  # Expecting 5 output files

# Rule to define how each file is generated
rule process_files:
    input:
        "input_file_{i}.txt"  # Assuming you have input files numbered 1 to 5
    output:
        "output_file_{i}.txt"
    resources:
        mem="4G",  # Example of memory resource
        nodes=1   # Each job will run on 1 node
    threads: 1
    shell:
        """
        echo "Processing {input}" > {output}
        # Example processing command
        sleep 10  # Simulating some work being done
        echo "Completed processing {input}" >> {output}
        """
