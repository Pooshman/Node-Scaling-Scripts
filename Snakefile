# Sample Snakefile

# Define the input and output files
rule all:
    input:
        "results/output.txt"

# Example rule to generate output.txt
rule generate_output:
    output:
        "results/output.txt"
    shell:
        """
        echo "This is a sample output" > {output}
        """
