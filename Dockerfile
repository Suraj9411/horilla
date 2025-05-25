FROM python:3.10-slim-bullseye

ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y libcairo2-dev gcc

# Set working directory
WORKDIR /app/

# Copy project files
COPY . .

# Make entrypoint executable
RUN chmod +x /app/entrypoint.sh

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 8000

# Use entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]
