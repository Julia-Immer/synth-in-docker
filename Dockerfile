# this Dockerfile starts the python interpreter
# Trying out arg
ARG PYTHON_VERSION=3.8-slim-buster
FROM python:${PYTHON_VERSION}

CMD ["python3"]