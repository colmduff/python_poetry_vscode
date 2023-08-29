FROM python:3.9.13

RUN apt update -y && \
  apt upgrade -y && \
  apt install -y --no-install-recommends \
  git \
  make \
  curl

RUN pip install cookiecutter

RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="$HOME/root/.local/bin:${PATH}"
