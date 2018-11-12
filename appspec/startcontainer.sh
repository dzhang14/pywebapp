#!/bin/bash
$(aws ecr get-login --no-include-email --region us-west-2)
docker pull 247383203886.dkr.ecr.us-west-2.amazonaws.com/dzhang14/pywebapp || {
    echo "ERROR: docker pull failed. Sleeping for 10 minutes to allow investigation..."
    sleep 600
    exit 1
}
docker run --name pywebapp -p 80:8080 --detach 247383203886.dkr.ecr.us-west-2.amazonaws.com/dzhang14/pywebapp:latest
