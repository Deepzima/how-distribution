#!/bin/bash

curl -f http://localhost:5001/v2/ || { echo "Registry non è in esecuzione"; exit 1; }

docker pull alpine
docker tag alpine localhost:5001/my-alpine
docker push localhost:5001/my-alpine


curl -f http://localhost:5001/v2/my-alpine/tags/list || { echo "L'immagine non è stata trovata nel registry"; exit 1; }

