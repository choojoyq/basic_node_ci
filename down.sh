#/bin/bash
docker-compose down
docker rm node_db
docker rm node_web
docker rmi -f basicnodeci_web
docker rmi -f basicnodeci_db
