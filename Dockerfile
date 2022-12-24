# this Dockerfile starts the python interpreter
# Trying out arg for practice only
ARG PYTHON_VERSION=3.8-slim-buster
FROM python:${PYTHON_VERSION}

# Before surrendering root privleges, cp requirements 
# make it world readable by putting it in temp
ENV APP_TMP_DATA=/tmp
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# change to non-root user before running app
RUN useradd -m myuser
USER myuser
WORKDIR /home/myuser
# ENTRYPOINT ["synthesizer.py"]


CMD ["python3"]