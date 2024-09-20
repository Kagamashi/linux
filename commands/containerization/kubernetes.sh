#!/bin/bash

kubectl                                   # Kubernetes command-line tool
minikube                                  # Manage Kubernetes clusters locally

# kubectl – Kubernetes command-line tool
kubectl version                           # Show the client and server version
kubectl get pods                          # List all pods in the current namespace
kubectl get services                      # List all services in the current namespace
kubectl describe pod <pod_name>           # Get detailed information about a specific pod
kubectl apply -f <file.yaml>              # Apply a configuration from a YAML file

# minikube – Manage Kubernetes clusters locally
minikube start                            # Start a local Minikube cluster
minikube stop                             # Stop the Minikube cluster
minikube dashboard                         # Open the Kubernetes dashboard in a web browser
minikube status                            # Check the status of the Minikube cluster
