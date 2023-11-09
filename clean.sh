docker-compose down
rm -rf app/logs/*
rm -rf app/logs/.*
rm -rf app/mysql/*
rm -rf app/mysql/.*
docker system prune --all --force