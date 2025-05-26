#!/bin/bash

echo "Waiting for database to be ready..."

# Run migrations and setup
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py collectstatic --noinput
python3 manage.py createhorillauser --first_name admin --last_name admin --username admin --password admin --email admin@example.com --phone 1234567890

# Start Gunicorn on the port Render provides
exec gunicorn horilla.wsgi:application --bind 0.0.0.0:$PORT
