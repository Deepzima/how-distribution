.PHON: up down

dup: 
	docker-compose -f docker-compose.yaml -f proxy/docker-compose.yaml -f storage/minio/docker-compose.yaml -f registry/docker-compose.yaml up -d

dup-build: 
	docker-compose -f docker-compose.yaml -f proxy/docker-compose.yaml -f storage/minio/docker-compose.yaml -f registry/docker-compose.yaml up -d --build