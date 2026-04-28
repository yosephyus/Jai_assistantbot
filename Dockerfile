FROM node:22-alpine

# Install OpenClaw globally
RUN npm install -g openclaw

# Create app directory
WORKDIR /app

# Copy config files
COPY openclaw.json /app/

# Make script executable
RUN chmod +x /app/openclaw.sh

# Expose gateway port
EXPOSE 18789

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:18789/ || exit 1

# Start gateway
CMD ["openclaw", "gateway", "--bind", "0.0.0.0", "--port", "18789"]