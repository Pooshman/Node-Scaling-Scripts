#!/bin/bash

# Variables
CLUSTER_NAME="my-cluster-3"
QUEUE_NAME="queue-1"
COMPUTE_RESOURCE="queue-1-cr-1"
MIN_NODES=0
MAX_NODES=10
DESIRED_NODES=5
REGION="us-east-1"

# Function to scale up the nodes
scaleUp() {
  # Fetch the instance ID dynamically based on the cluster name and compute resource
  INSTANCE_ID=$(aws ec2 describe-instances \
    --filters "Name=tag:Name,Values=$CLUSTER_NAME" \
    --query "Reservations[*].Instances[*].InstanceId" \
    --output text \
    --region $REGION)

  if [ -z "$INSTANCE_ID" ]; then
    echo "Failed to fetch the instance ID. Check your filters and cluster name."
    exit 1
  fi

  aws ec2 modify-instance-attribute \
    --region $REGION \
    --instance-id $INSTANCE_ID \
    --attribute instanceType \
    --value $COMPUTE_RESOURCE

  if [ $? -eq 0 ]; then
    echo "Successfully scaled the compute nodes to $DESIRED_NODES."
  else
    echo "Failed to scale the compute nodes."
    exit 1
  fi
}

# Call the function to scale up the nodes
scaleUp
