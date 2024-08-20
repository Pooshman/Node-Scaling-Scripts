#!/bin/bash

# Variables
CLUSTER_NAME="my-new-cluster-2"
QUEUE_NAME="queue-1"  # The name of your Slurm queue
COMPUTE_RESOURCE="queue-1-cr-1"  # The name of your compute resource within the queue
MIN_NODES=0  # Minimum number of nodes (can be 0 to allow scaling down to zero)
MAX_NODES=10  # Maximum number of nodes
DESIRED_NODES=5  # The desired number of nodes you want to scale to

# Function to scale up the nodes
scaleUp() {
  aws ec2 modify-instance-attribute \
    --instance-id $(aws ec2 describe-instances --filters "Name=tag:aws:parallelcluster:cluster-name,Values=$CLUSTER_NAME" "Name=tag:aws:parallelcluster:queue-name,Values=$QUEUE_NAME" "Name=tag:aws:parallelcluster:compute-resource-name,Values=$COMPUTE_RESOURCE" --query "Reservations[*].Instances[*].InstanceId" --output text) \
    --region us-east-1 \
    --instance-type $COMPUTE_RESOURCE \
    --min-count $MIN_NODES \
    --max-count $MAX_NODES \
    --desired-count $DESIRED_NODES
}

# Call the function
scaleUp

# Check if the scaling was successful
if [ $? -eq 0 ]; then
  echo "Successfully scaled the compute nodes to $DESIRED_NODES."
else
  echo "Failed to scale the compute nodes."
fi
