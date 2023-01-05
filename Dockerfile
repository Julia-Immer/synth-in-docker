# this Dockerfile starts the python interpreter
# Trying out arg for practice only
ARG PYTHON_VERSION=3.8-slim-buster
FROM python:${PYTHON_VERSION}

WORKDIR /app

# Before surrendering root privleges, cp requirements and app
# make requirements world readable 
COPY --chmod=0755 ./requirements.txt ./
COPY ./synthesizer-app.py ./

# install requirements
# create user for app
RUN pip install -r requirements.txt && \
    useradd myuser

# change to non-root user before running app
USER myuser

CMD ["python3", "synthesizer-app.py"]