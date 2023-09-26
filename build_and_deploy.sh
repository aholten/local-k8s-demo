#!/bin/bash

minikube start
eval $(minikube docker-env)
docker build -t bun_http_server:v1 .
kubectl apply -f deployment.yml
sleep 10
kubectl wait --for=condition=ready pod -l app --timeout=60s
kubectl port-forward service/bun-http-server 3000:3000
