#!/bin/bash

# Variables
CLUSTER_NAME="my-cluster-3"
QUEUE_NAME="queue-1"  # The name of your Slurm queue
COMPUTE_RESOURCE="queue-1-cr-1"  # The name of your compute resource within the queue
MIN_NODES=0  # Minimum number of nodes
MAX_NODES=10  # Maximum number of nodes
DESIRED_NODES=5  # The desired number of nodes you want to scale to
REGION="us-east-1"  # Specify your AWS region here

# Get the Auto Scaling Group name for the compute resources
ASG_NAME=$(aws ec2 describe-tags --filters "Name=resource-type,Values=auto-scaling-group" "Name=key,Values=parallelcluster:cluster-name" "Name=value,Values=$CLUSTER_NAME" "Name=key,Values=parallelcluster:compute-resource-name" "Name=value,Values=$COMPUTE_RESOURCE" --region $REGION --query "Tags[0].ResourceId" --output text)

# Check if ASG_NAME is not empty
if [ -z "$ASG_NAME" ]; then
  echo "Failed to find Auto Scaling Group for the specified compute resource."
  exit 1
fi

# Scale the Auto Scaling Group
aws autoscaling update-auto-scaling-group \
  --auto-scaling-group-name $ASG_NAME \
  --min-size $MIN_NODES \
  --max-size $MAX_NODES \
  --desired-capacity $DESIRED_NODES \
  --region $REGION

# Check if the scaling was successful
if [ $? -eq 0 ]; then
  echo "Successfully scaled the compute nodes to $DESIRED_NODES."
else
  echo "Failed to scale the compute nodes."
fi
