FROM --platform=linux/amd64 python:3.9-slim-buster

ENV PORT=5000

# First copy requirements and install to use caching
COPY requirements.txt /code/requirements.txt
WORKDIR /code/
RUN pip install -r requirements.txt

# Copy our Flask app to the Docker image
COPY app.py /code/

CMD gunicorn app:app -w 2 --threads 2 -b 0.0.0.0:${PORT}