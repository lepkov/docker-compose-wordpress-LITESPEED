#!/bin/bash

docker-compose down
rm -rf app/logs/* && rm -rf app/logs/.*
docker system prune --all --force