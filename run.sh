#!/bin/bash

set -e  # หากคำสั่งใดล้มเหลว ให้หยุด script ทันที

echo "Pulling latest code from git..."
git pull
echo "Done."

echo "Stopping and removing containers, networks, and volumes..."
docker compose down -v
echo "Done."

echo "Building docker images without cache..."
docker compose build --no-cache
echo "Done."

echo "Starting containers in detached mode..."
docker compose up -d
echo "Done."