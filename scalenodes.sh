#!/bin/bash

# Variables
CLUSTER_NAME="my-new-cluster-2"
QUEUE_NAME="queue-1"
COMPUTE_RESOURCE="queue-1-cr-1"
MIN_NODES=0
MAX_NODES=10
DESIRED_NODES=5
REGION="us-east-1"

# Function to scale up the nodes
scaleUp() {
  aws ec2 modify-instance-attribute \
    --region $REGION \
    --instance-id $INSTANCE_ID \
    --attribute instanceType \
    --value $COMPUTE_RESOURCE
}

# Call the function to scale up the nodes
scaleUp

# Check if the scaling was successful
if [ $? -eq 0 ]; then
  echo "Successfully scaled the compute nodes to $DESIRED_NODES."
else
  echo "Failed to scale the compute nodes."
fi
