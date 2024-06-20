#!/bin/bash

curl -f http://localhost:5001/v2/ || { echo "Registry not in execution"; exit 1; }

docker pull alpine
docker tag alpine localhost:5001/my-alpine
docker push localhost:5001/my-alpine


curl -f http://localhost:5001/v2/my-alpine/tags/list || { echo "Image not finded in this registry"; exit 1; }

