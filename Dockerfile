# Dockerfile

# Base image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

RUN apt-get update && apt-get install -y \
    libpq-dev gcc
    
# Install dependencies
# COPY requirements.txt /app/
# RUN pip install -r requirements.txt

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt


# Copy project files
COPY . /app/

# Collect static files
RUN python manage.py collectstatic --noinput

# Expose the port on which the application runs
EXPOSE 8000

# Start Gunicorn server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "myproject.wsgi:application"]
