FROM python:3.9.13

# Update package lists and install required packages
RUN apt update -y && \
  apt upgrade -y && \
  apt install -y --no-install-recommends \
  git \
  make \
  curl

# Create a non-root user named "vscode" with UID and GID set to 1000
RUN useradd -ms /bin/bash -u 1000 -U vscode

# Set the user to "vscode" for subsequent commands
USER vscode

# Install Python packages with pip, they will be installed in the user's home directory
RUN pip install --user cookiecutter

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add the user's local bin directory to the PATH
ENV PATH="/home/vscode/.local/bin:${PATH}"

