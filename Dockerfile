FROM python:3.10.7-buster

ENV PYTHONPATH="${PYTHONPATH}"

WORKDIR /analytics

# Install nodejs
RUN export NODE_OPTIONS=--max-old-space-size=4096
RUN apt-get update
RUN apt-get install -y build-essential
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

# Installing requirements
RUN pip install poetry==1.2.1
ENV POETRY_VERSION=1.2.1
COPY pyproject.toml poetry.lock* /analytics/
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

# Unset NOTE_OPTIONS environment variable
# (OS X/Linux)
RUN unset NODE_OPTIONS