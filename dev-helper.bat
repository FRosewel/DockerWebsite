@echo off
REM Personal Website - Local Development Script (Windows)
REM This script helps with common development tasks

echo 🚀 Personal Website Development Helper
echo ======================================

REM Function to check if Docker is running
:check_docker
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker is not running. Please start Docker Desktop.
    exit /b 1
)
echo ✅ Docker is running
goto :eof

REM Function to build Docker image
:build_image
echo 🔨 Building Docker image...
docker build -t my-personal-website .
if %errorlevel% equ 0 (
    echo ✅ Docker image built successfully!
) else (
    echo ❌ Docker build failed!
)
goto :eof

REM Function to run container
:run_container
echo 🏃 Starting container...
docker run -d --name personal-website -p 3000:3000 my-personal-website
if %errorlevel% equ 0 (
    echo ✅ Container started! Visit http://localhost:3000
) else (
    echo ❌ Failed to start container!
)
goto :eof

REM Function to stop and remove container
:cleanup
echo 🧹 Cleaning up containers...
docker stop personal-website >nul 2>&1
docker rm personal-website >nul 2>&1
echo ✅ Cleanup complete!
goto :eof

REM Function to run tests
:run_tests
echo 🧪 Running tests...
cd getting-started-app
npm test
cd ..
goto :eof

REM Function to show logs
:show_logs
echo 📋 Container logs:
docker logs personal-website
goto :eof

REM Function to show status
:show_status
docker ps | findstr personal-website
if %errorlevel% neq 0 (
    echo Container not running
)
goto :eof

REM Main menu
if "%1"=="build" (
    call :check_docker
    call :build_image
) else if "%1"=="run" (
    call :check_docker
    call :cleanup
    call :build_image
    call :run_container
) else if "%1"=="stop" (
    call :cleanup
) else if "%1"=="test" (
    call :run_tests
) else if "%1"=="logs" (
    call :show_logs
) else if "%1"=="status" (
    call :show_status
) else (
    echo Usage: %0 {build^|run^|stop^|test^|logs^|status}
    echo.
    echo Commands:
    echo   build  - Build Docker image
    echo   run    - Build and run container
    echo   stop   - Stop and remove container
    echo   test   - Run test suite
    echo   logs   - Show container logs
    echo   status - Check container status
)
