# this Dockerfile starts the python interpreter
# Trying out arg for practice only
ARG PYTHON_VERSION=3.8-slim-buster
FROM python:${PYTHON_VERSION}

WORKDIR /app

ENV TMP=/tmp \
    REQ_PATH=requirements.txt \
    APP_PATH=synthesizer-app.py

# Before surrendering root privleges, cp requirements 
# make it world readable by putting it in temp
COPY ${REQ_PATH} ${TMP}
COPY --chmod=0755 ${APP_PATH} /app/

# install requirements
# create user for app
# try to make app file world-readable so myuser can use it
RUN pip install -r ${TMP}/${REQ_PATH} && \
    useradd myuser
    # chmod +rx ./${APP_PATH}

# change to non-root user before running app
USER myuser

CMD ["python3", "synthesizer-app.py"]