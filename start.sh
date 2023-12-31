#!/bin/bash

rm -rf app/logs/* && rm -rf app/logs/.*
docker-compose up -d