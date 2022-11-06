# Python is not needed, but I need to base on something
FROM python:3-slim

# create folder for db and attachments
RUN mkdir -p /data/gotosocial/storage

COPY . /app
WORKDIR /app

EXPOSE 8080

CMD ["./gotosocial", "--config-path", "./config.yaml", "server", "start"]
