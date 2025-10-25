# Personal Website - Dockerized Node.js Application

A modern, containerized personal website built with Node.js, Express, and SQLite, featuring automated testing and CI/CD pipeline.

## 🚀 Features

- **Modern Web Application**: Built with Node.js and Express
- **Database Integration**: SQLite database for data persistence
- **RESTful API**: Full CRUD operations for items management
- **Responsive UI**: Bootstrap-based frontend
- **Docker Support**: Fully containerized application
- **Automated Testing**: Jest and Supertest integration
- **CI/CD Pipeline**: GitHub Actions for continuous integration
- **Health Checks**: Built-in container health monitoring

## 📋 Prerequisites

- Docker Desktop installed and running
- Node.js 18+ (for local development)
- Git (for version control)

## 🛠️ Quick Start

### Using Docker (Recommended)

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd AiDDDocker2
   ```

2. **Build the Docker image**
   ```bash
   docker build -t my-personal-website .
   ```

3. **Run the container**
   ```bash
   docker run -d --name personal-website -p 3000:3000 my-personal-website
   ```

4. **Access your website**
   - Open your browser and go to `http://localhost:3000`
   - API endpoints available at `http://localhost:3000/items`

### Using Docker Compose

1. **Start the application**
   ```bash
   docker-compose up -d
   ```

2. **View logs**
   ```bash
   docker-compose logs -f
   ```

### Local Development

1. **Install dependencies**
   ```bash
   cd getting-started-app
   npm install
   ```

2. **Run the application**
   ```bash
   npm run dev
   ```

3. **Run tests**
   ```bash
   npm test
   ```

## 🧪 Testing

The project includes comprehensive test suites:

- **Database Tests**: `test_database.js` - Tests database connectivity and API endpoints
- **Project Tests**: `test_projects.js` - Tests frontend functionality and error handling

Run tests locally:
```bash
cd getting-started-app
npm test
```

## 🔧 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/` | Serve the main website |
| GET | `/items` | Retrieve all items |
| POST | `/items` | Create a new item |
| PUT | `/items/:id` | Update an existing item |
| DELETE | `/items/:id` | Delete an item |

## 🐳 Docker Configuration

### Dockerfile Features
- **Multi-stage build** for optimized image size
- **Health checks** for container monitoring
- **Proper layer caching** for faster builds
- **Security best practices** with non-root user

### Container Health Check
The container includes a built-in health check that verifies the application is responding correctly.

## 🚀 CI/CD Pipeline

The project includes a GitHub Actions workflow (`.github/workflows/ci-cd.yml`) that:

1. **Runs Tests**: Executes Jest test suites
2. **Code Quality**: Runs Prettier linting
3. **Docker Build**: Builds and tests the Docker image
4. **Container Testing**: Verifies container functionality
5. **Deployment Ready**: Prepares for production deployment

### Workflow Triggers
- Push to `main` or `master` branch
- Pull requests to `main` or `master` branch

## 📁 Project Structure

```
├── .github/
│   └── workflows/
│       └── ci-cd.yml          # GitHub Actions CI/CD pipeline
├── getting-started-app/
│   ├── src/
│   │   ├── index.js           # Main application file
│   │   ├── persistence/       # Database layer
│   │   └── routes/            # API route handlers
│   ├── static/                # Frontend assets
│   ├── spec/                  # Test specifications
│   ├── test_database.js       # Database tests
│   ├── test_projects.js       # Project tests
│   └── package.json           # Dependencies and scripts
├── Dockerfile                 # Docker configuration
├── docker-compose.yml         # Docker Compose configuration
├── .gitignore                 # Git ignore rules
└── README.md                  # This file
```

## 🔍 Troubleshooting

### Common Issues

1. **Port 3000 already in use**
   ```bash
   # Find and kill the process using port 3000
   netstat -ano | findstr :3000
   # Or use a different port
   docker run -p 3001:3000 my-personal-website
   ```

2. **Docker build fails**
   ```bash
   # Ensure Docker Desktop is running
   # Check Dockerfile syntax
   docker build --no-cache -t my-personal-website .
   ```

3. **Container won't start**
   ```bash
   # Check container logs
   docker logs <container-name>
   # Verify health check
   docker inspect <container-name>
   ```

## 📝 Development Notes

- The application uses SQLite for data persistence
 - Database file is stored in `/etc/todos/todo.db` within the container when running via Docker.
 - For local development and tests (when `SQLITE_DB_LOCATION` isn't set) the application now falls back to a repo-local file at `todos/todo.db`.
- Static files are served from the `static/` directory
- All API responses are in JSON format

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Ensure all tests pass
6. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🎯 Next Steps

- [ ] Add authentication and user management
- [ ] Implement real-time updates with WebSockets
- [ ] Add more comprehensive error handling
- [ ] Set up production deployment pipeline
- [ ] Add monitoring and logging
- [ ] Implement caching strategies

---

**Happy coding! 🚀**
