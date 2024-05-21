#!/bin/bash

# Set the Kubernetes context if necessary
#kubectl config use-context <context-name>

# Run kubectl command
kubectl get ns
kubectl apply -f deploy.yaml -n test
kubectl get pod -n test