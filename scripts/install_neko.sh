#!/usr/bin/env bash

# Variables
APP_DIR="/app"
DOCKER_COMPOSE_URL="https://raw.githubusercontent.com/nurdism/neko/master/docker-compose.yaml"

# Functions

## Get the Docker Compose file
get_docker_compose()
{
  echo "Retrieving docker-compose.yaml..."
  wget ${DOCKER_COMPOSE_URL}
}

## Run the compose file
run_docker_compose()
{
  echo "Running docker-compose..."
  docker-compose up -d
}

## Setup APP_DIR
setup_app_dir()
{
  echo "Setting up ${APP_DIR}..."
  if ! [[ -d "/app" ]]; then
    mkdir -p ${APP_DIR}
  fi

  cd ${APP_DIR}
}

# Logic
setup_app_dir
get_docker_compose
run_docker_compose
