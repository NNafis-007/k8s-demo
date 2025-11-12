#!/bin/bash
echo "Starting K8s Deployment..."

USERNAME=nnafis007
NAME=k8s-demo-api
IMAGE="$USERNAME/$NAME:latest"

echo "  1. Building Docker Image..."
docker build -t $IMAGE .

echo "  2. Pushing to docker hub..."
docker push $IMAGE

echo "  3. Creating K8s pods for DEPLOYMENT..."
kubectl apply -f K8s/deployment.yaml

echo "  4. Creating K8s Service..."
kubectl apply -f K8s/service.yaml

echo "  5. Getting pods for verification..."
kubectl get pods

echo "  5. Getting services for verification..."
kubectl get services
