#!/bin/bash

python /app/manage.py makemigrations
python /app/manage.py migrate

uwsgi --yaml /app/infra/uwsgi.yaml
