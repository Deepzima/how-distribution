#!/bin/bash

curl -f http://registry.local/v2/ || { echo "Registry not in execution"; exit 1; }

docker pull alpine
docker tag alpine registry.local/my-alpine
docker push registry.local/my-alpine


curl -f http://registry.local/v2/my-alpine/tags/list || { echo "Image not finded in this registry"; exit 1; }

