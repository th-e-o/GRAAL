#!/bin/bash

# Script to start local Neo4j database using Docker

set -e

echo "🚀 Starting local Neo4j database..."

# Check if docker and docker-compose are available
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed."
    echo "📦 Run: bash scripts/install_docker.sh"
    echo "   Or visit: https://docs.docker.com/get-docker/"
    exit 1
fi

# Check for Docker Compose (v2) or docker-compose (v1)
if command -v docker compose &> /dev/null; then
    DOCKER_COMPOSE_CMD="docker compose"
    echo "✅ Using Docker Compose v2"
elif command -v docker-compose &> /dev/null; then
    DOCKER_COMPOSE_CMD="docker-compose"
    echo "✅ Using Docker Compose v1"
else
    echo "❌ Docker Compose is not installed."
    echo "📦 Run: bash scripts/install_docker.sh"
    echo "   Or visit: https://docs.docker.com/compose/install/"
    exit 1
fi

# Start the Neo4j container
$DOCKER_COMPOSE_CMD up -d

# Wait for Neo4j to be ready
echo "⏳ Waiting for Neo4j to start..."
sleep 10

COUNTER=0
MAX_ATTEMPTS=5

while [ $COUNTER -lt $MAX_ATTEMPTS ]; do
    if $DOCKER_COMPOSE_CMD exec neo4j curl -s http://localhost:7474/db/neo4j/exec?query=RETURN%201 > /dev/null 2>&1; then
        echo "✅ Neo4j is ready!"
        break
    fi
    COUNTER=$((COUNTER + 1))
    echo "⏳ Waiting... ($COUNTER/$MAX_ATTEMPTS)"
    sleep 2
done

if [ $COUNTER -eq $MAX_ATTEMPTS ]; then
    echo "❌ Neo4j failed to start after ${MAX_ATTEMPTS} attempts"
    echo "📋 Docker logs:"
    $DOCKER_COMPOSE_CMD logs neo4j
    exit 1
fi

echo ""
echo "✅ Local Neo4j database is ready!"
echo ""
echo "📊 Neo4j Dashboard: http://localhost:7474"
echo "🔌 Connection URL: bolt://localhost:7687"
echo "👤 Username: neo4j"
echo "🔐 Password: password123"
echo ""
echo "To stop the database, run: docker-compose down"
echo "To view logs, run: docker-compose logs -f neo4j"
