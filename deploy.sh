#!/usr/bin/env bash
#setting up the env

echo "Starting deployment..."
aws ecr get-login-password | docker login -u AWS --password-stdin "https://$(aws sts get-caller-identity --query 'Account' --output text).dkr.ecr.us-east-1.amazonaws.com"

docker build -t swami-node-app .
docker tag swami-node-app:latest 104774229064.dkr.ecr.us-east-1.amazonaws.com/swami-node-app:latest
docker push 104774229064.dkr.ecr.us-east-1.amazonaws.com/swami-node-app:latest
docker image rm 104774229064.dkr.ecr.us-east-1.amazonaws.com/swami-node-app:latest
