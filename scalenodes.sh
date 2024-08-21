#!/bin/bash

# Variables
CLUSTER_NAME="my-cluster-3"
QUEUE_NAME="queue-1"  # The name of your Slurm queue
COMPUTE_RESOURCE="queue-1-cr-1"  # The name of your compute resource within the queue
MIN_NODES=0  # Minimum number of nodes
MAX_NODES=10  # Maximum number of nodes
DESIRED_NODES=5  # The desired number of nodes you want to scale to
REGION="us-east-1"  # Specify your AWS region here

# Function to scale up the nodes
scaleUp() {
  aws parallelcluster update-compute-fleet \
    --cluster-name $CLUSTER_NAME \
    --region $REGION \
    --status RUNNING

  aws parallelcluster update-compute-fleet \
    --cluster-name $CLUSTER_NAME \
    --region $REGION \
    --compute-resources "[{\"Name\":\"$COMPUTE_RESOURCE\",\"MinCount\":$MIN_NODES,\"MaxCount\":$MAX_NODES,\"DesiredCount\":$DESIRED_NODES}]"
}

# Call the function
scaleUp

# Check if the scaling was successful
if [ $? -eq 0 ]; then
  echo "Successfully scaled the compute nodes to $DESIRED_NODES."
else
  echo "Failed to scale the compute nodes."
fi

