FROM python:3.9-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/fartbagxp/serverless-action"
LABEL homepage="https://github.com/fartbagxp/serverless-action"
LABEL maintainer="Boris Ning <fartbagxp@gmail.com>"

LABEL "com.github.actions.name"="Github Action for Python projects using Serverless Framework"
LABEL "com.github.actions.description"="Wraps the Serverless Framework including pip/pipenv/poetry to enable common Serverless commands."
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="green"

# Install curl & xz (to install node below)
RUN apt update && apt install -y curl xz-utils && rm -rf /var/lib/apt/lists/*

# Install node
RUN curl https://nodejs.org/dist/v14.15.5/node-v14.15.5-linux-x64.tar.xz | tar xJ -C /opt
ENV PATH="/opt/node-v14.15.5-linux-x64/bin:${PATH}"

# Install pipenv
RUN pip3 install pipenv

# Install poetry
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python3

# Install serverless
RUN npm i -g serverless

ENTRYPOINT ["serverless"]
