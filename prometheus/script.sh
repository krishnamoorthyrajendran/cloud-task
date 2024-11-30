#!/bin/bash

# Set the namespace and label selector to identify the pod
NAMESPACE="default" 
LABEL_SELECTOR="app=web-app"  
LOGS_BACKUP_DIR="/home/krishnamoorthy/Desktop/task-4/prometheus/test"  

# Get the pod name dynamically
POD_NAME=$(kubectl get pod -n $NAMESPACE -l $LABEL_SELECTOR -o jsonpath='{.items[0].metadata.name}')

# Retrieve logs from the pod and save them to a file
LOG_FILE="$LOGS_BACKUP_DIR/logs-$(date +"%Y%m%d%H%M%S").log"

# Backup the log file
kubectl logs $POD_NAME -n $NAMESPACE > $LOG_FILE

# Move the logs files to s3 bucket
aws s3 cp $LOG_FILE s3://my-pod-logs-bucket/
