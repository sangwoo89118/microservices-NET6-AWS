#!/bin/bash
set -e

aws ecr get-login-password --region us-east-1 --profiole weather-ecr-agent | docker login --username AWS --password-stdin 333370384318.dkr.ecr.us-west-1.amazonaws.com
docker build -f ./Dockerfile -t cloud-weather-data-loader:latest .
docker tag cloud-weather-data-loader:latest 333370384318.dkr.ecr.us-west-1.amazonaws.com/cloud-weather-data-loader:latest
docker push 333370384318.dkr.ecr.us-west-1.amazonaws.com/cloud-weather-data-loader:latest