#!/bin/bash

# Personal Website - Local Development Script
# This script helps with common development tasks

echo "🚀 Personal Website Development Helper"
echo "======================================"

# Function to check if Docker is running
check_docker() {
    if ! docker info > /dev/null 2>&1; then
        echo "❌ Docker is not running. Please start Docker Desktop."
        exit 1
    fi
    echo "✅ Docker is running"
}

# Function to build Docker image
build_image() {
    echo "🔨 Building Docker image..."
    docker build -t my-personal-website .
    echo "✅ Docker image built successfully!"
}

# Function to run container
run_container() {
    echo "🏃 Starting container..."
    docker run -d --name personal-website -p 3000:3000 my-personal-website
    echo "✅ Container started! Visit http://localhost:3000"
}

# Function to stop and remove container
cleanup() {
    echo "🧹 Cleaning up containers..."
    docker stop personal-website 2>/dev/null || true
    docker rm personal-website 2>/dev/null || true
    echo "✅ Cleanup complete!"
}

# Function to run tests
run_tests() {
    echo "🧪 Running tests..."
    cd getting-started-app
    npm test
    cd ..
}

# Function to show logs
show_logs() {
    echo "📋 Container logs:"
    docker logs personal-website
}

# Main menu
case "$1" in
    "build")
        check_docker
        build_image
        ;;
    "run")
        check_docker
        cleanup
        build_image
        run_container
        ;;
    "stop")
        cleanup
        ;;
    "test")
        run_tests
        ;;
    "logs")
        show_logs
        ;;
    "status")
        docker ps | grep personal-website || echo "Container not running"
        ;;
    *)
        echo "Usage: $0 {build|run|stop|test|logs|status}"
        echo ""
        echo "Commands:"
        echo "  build  - Build Docker image"
        echo "  run    - Build and run container"
        echo "  stop   - Stop and remove container"
        echo "  test   - Run test suite"
        echo "  logs   - Show container logs"
        echo "  status - Check container status"
        ;;
esac
