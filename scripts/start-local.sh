#!/bin/bash

set -e

echo "Starting Azure LAMP Platform..."

docker compose up -d

echo ""
echo "Running containers:"
docker ps

echo ""
echo "Jenkins:"
echo "http://localhost:8080"

echo ""
echo "PHP Application:"
echo "http://localhost"

echo ""
echo "phpMyAdmin:"
echo "http://localhost:8081"
