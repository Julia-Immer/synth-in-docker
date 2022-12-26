# this Dockerfile starts the python interpreter
# Trying out arg for practice only
ARG PYTHON_VERSION=3.8-slim-buster
FROM python:${PYTHON_VERSION}

ENV APP_TMP_DATA=./tmp \
    REQ_PATH=requirements.txt \
    APP_PATH=synthesizer-app.py

# Before surrendering root privleges, cp requirements 
# make it world readable by putting it in temp
COPY ${REQ_PATH} ${APP_TMP_DATA}
COPY ${APP_PATH} .

# install requirements
# create user for app
# try to make app file world-readable so myuser can use it
RUN pip install -r ${APP_TMP_DATA}/${REQ_PATH} && \
    useradd myuser && \
    chmod +rx ./${APP_PATH}

# change to non-root user before running app
USER myuser
# currently cannot find file
# ENTRYPOINT [./${APP_PATH}]
# python3: 1: python3: [./synthesizer-app.py]: not found

CMD ["python3"]