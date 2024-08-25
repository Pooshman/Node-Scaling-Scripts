# Define the input and output files
rule all:
    input:
        "results/output.txt"

# Rule to execute staticnodes.sh script on all nodes
rule execute_staticnodes:
    output:
        "results/output.txt"
    shell:
        """
        sbatch staticnodes.sh
        touch {output}
        """
