# Use an official Python slim image as the base
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy requirements first (for better Docker layer caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Expose port 5000 for the Flask application
EXPOSE 5000

# Run the Flask application using gunicorn on port 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
