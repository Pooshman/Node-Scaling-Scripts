rule all:
    input:
        expand("output/test_node_{i}.txt", i=range(1, 6))

rule test_parallel:
    output:
        "output/test_node_{i}.txt"
    resources:
        cpus_per_task=1,
        mem_mb=2000,   # Adjust as needed
        nodes=1        # Each job runs on one node
    shell:
        """
        echo "Running on node {wildcards.i}" > {output}
        sleep 30  # Simulate workload
        """
