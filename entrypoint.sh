#!/bin/bash

echo "Waiting for database to be ready..."

# Run migrations and setup
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py collectstatic --noinput
python3 manage.py createhorillauser --first_name suraj --last_name rawat --username suraj --password admin123 --email surajrwtbro9411@gmail.com --phone 8433260352

# Start Gunicorn on the port Render provides
exec gunicorn horilla.wsgi:application --bind 0.0.0.0:$PORT
