FROM python:3.9.13

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupmod --gid $USER_GID $USERNAME \
    && usermod --uid $USER_UID --gid $USER_GID $USERNAME \
    && chown -R $USER_UID:$USER_GID /home/$USERNAME

RUN apt update -y && \
  apt upgrade -y && \
  apt install -y --no-install-recommends \
  git \
  make \
  curl

RUN pip install cookiecutter

RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="$HOME/vscode/.local/bin:${PATH}"
