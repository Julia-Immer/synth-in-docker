# this Dockerfile starts the python interpreter
# Trying out arg for practice only
ARG PYTHON_VERSION=3.8-slim-buster
FROM python:${PYTHON_VERSION}

# Before surrendering root privleges, cp requirements 
# make it world readable by putting it in temp
ENV APP_TMP_DATA=/tmp
COPY requirements.txt synthesizer-app.py ./tmp/
RUN pip install -r /tmp/requirements.txt && \
    useradd myuser

# change to non-root user before running app
USER myuser
# currently cannot find file
# ENTRYPOINT ["/tmp/synthesizer-app.py"] # need to make accessible to my user

CMD ["python3"]