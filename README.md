# A Project For Practicing Docker and CI/CD Tools
A very simple practice Dockerfile which runs a python app.

A musical synthesizer app, developed Dockerfile-first to use containerization and CI/CD tools.

## Build And Run This App

cd into this folder.
`docker build -t synth-in-docker .`
`docker run -it -t synth-in-docker`

## Current Status

Python synth program runs locally, but, as expected after development, there are issues with pip and the synthesizer library getting all it needs installed.  Perhaps I shall abandon this annoying issue with pip and use a different library altogether, since the purpose is to explore CI/CD tools.
