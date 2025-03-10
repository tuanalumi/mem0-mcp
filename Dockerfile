# Use Python 3.12 as base image
FROM python:3.13-slim

# Set working directory
WORKDIR /app

# Install uv
RUN pip install uv

# Copy project files
COPY . .

# Create and activate virtual environment, install dependencies
RUN uv venv && \
    . .venv/bin/activate && \
    uv pip install -e .

# Expose the default port
EXPOSE 8080

# Command to run the server
CMD ["uv", "run", "main.py", "--host", "0.0.0.0", "--port", "8080"]