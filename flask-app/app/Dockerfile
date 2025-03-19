# Use Python Image
FROM python:3.9-slim

# Set working directory inside container
WORKDIR /app

# Copy the requirements file
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy application code
COPY . /app

# Expose default Flask app port
EXPOSE 5000

# Entry point for container
CMD ["python", "main.py"]
