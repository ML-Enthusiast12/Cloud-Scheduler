# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
    
# Copy the rest of your application code
COPY . .

# Tell functions-framework which function to expose
ENV FUNCTION_TARGET=write_to_storage
ENV FUNCTION_SIGNATURE_TYPE=http
ENV PORT=8080

# Expose the port used by the functions framework
EXPOSE 8080

# Run the function using the Functions Framework
CMD ["functions-framework", "--target=write_to_storage", "--port=8080"]
