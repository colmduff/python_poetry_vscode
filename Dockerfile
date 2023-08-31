FROM python:3.9.13

# Update package lists and install required packages
RUN apt update -y && \
  apt upgrade -y && \
  apt install -y --no-install-recommends \
  git \
  make \
  curl

# Install Python packages with pip, they will be installed in the user's home directory
RUN pip install --user cookiecutter

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add the user's local bin directory to the PATH
ENV PATH="/home/root/.local/bin:${PATH}"

