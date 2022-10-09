# Conrad Class Sandbox
A dockerized Jupyter Notebook environment. No python install needed, just Docker!

# Set up

## Steps

1. ** Install Docker **
2. run `make`. This is only needed the first time you run the sandbox, or there were library changes. If on Windows, `docker build -t conrad-class-sandbox:latest .` instead of `make`
5. run `docker-compose up` to get the service running. Go to localhost:9000 to access the notebook server.
6. If you want to have some additional secrets (environment variables) present, you can create a `docker-compose.override.yml` like the following:
```
services:
  notebook:
    environment: &notebook_env
    DB_USERNAME: 
    DB_PASSWORD: 
    SSH_USERNAME: 
    SSH_PKEY_PASSWORD: 
    AWS_USERNAME: 
    AWS_PASSWORD: 
    AWS_ACCOUNT_ID:  
```

## Updating libraries

You can add new python libraries to the pyproject.toml file using Poetry Syntax: https://python-poetry.org/docs/dependency-specification/. You will then need to run make again.