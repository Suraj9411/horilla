#!/bin/bash

# Install dependencies
pip install -r requirements.txt

# Collect static files & run migrations
python manage.py collectstatic --noinput
python manage.py migrate