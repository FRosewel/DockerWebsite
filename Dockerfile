# syntax=docker/dockerfile:1

FROM node:lts-alpine

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY getting-started-app/package*.json ./
COPY getting-started-app/yarn.lock ./

# Install dependencies
RUN npm install

# Copy application code
COPY getting-started-app/ ./

# Create directory for database
RUN mkdir -p /etc/todos

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://localhost:3000/', (res) => { process.exit(res.statusCode === 200 ? 0 : 1) })"

# Start the application
CMD ["node", "src/index.js"]