FROM python:3.8-slim

RUN useradd -ms /bin/bash norootuser

WORKDIR /app

COPY requirements.txt /app/
COPY ./infra/uwsgi.yaml /app/infra/uwsgi.yaml
COPY ./infra/docker/entrypoint.sh /docker-entrypoint.sh
COPY . /app/

RUN apt-get update && apt-get install -y gcc postgresql-client && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

RUN chmod +x "/docker-entrypoint.sh"
ENTRYPOINT ["/docker-entrypoint.sh"]

RUN chown -R norootuser /app

USER norootuser