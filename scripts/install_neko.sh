#!/usr/bin/env bash

# Variables

DISPLAY=${DISPLAY:-':99.0'}
IMAGE=${IMAGE:-'nurdism/neko:firefox'}
NEKO_BIND=${NEKO_BIND:-':8080'}
NEKO_CERT=${NEKO_CERT:-''}
NEKO_KEY=${NEKO_KEY:-''}
NEKO_PASSWORD=${NEKO_PASSWORD:-'neko'}
NEKO_PASSWORD_ADMIN=${NEKO_PASSWORD_ADMIN:-'admin'}
RESTART=${RESTART:-'always'}
SHM_SIZE=${SHM_SIZE:-'1gb'}

# Functions

## Install the container
install_container()
{
  echo "Setting up container..."
  docker pull ${IMAGE}
}

## Run the container
run_container()
{
  echo "Running the container..."
  docker run -it \
    -d \
    --restart=${RESTART} \
    --shm-size=${SHM_SIZE} \
    -e DISPLAY=${DISPLAY} \
    -e NEKO_PASSWORD_ADMIN=${NEKO_PASSWORD_ADMIN} \
    -e NEKO_BIND=${NEKO_BIND} \
    -e NEKO_CERT=${NEKO_CERT} \
    -e NEKO_KEY=${NEKO_KEY} \
    -e NEKO_PASSWORD=${NEKO_PASSWORD} \
    -p 80:8080 \
    -p 59000-59100:59000-59100/udp \
    --name='neko' \
    ${IMAGE}
}

## Display usage information
usage()
{
  echo "Usage: [Environment Variables] install_neko.sh [arguments]"
  echo "  Arguments:"
  echo "    -h                     display usage information"
  echo "  Environment Variables:"
  echo "    DISPLAY                loopback display (default: ':99.0')"
  echo "    IMAGE                  the image to pull (default: 'nurdism/neko:firefox')"
  echo "    NEKO_BIND              interface port to bind to (default: ':8080')"
  echo "    NEKO_CERT              certificate for SSL (default: '')"
  echo "    NEKO_KEY               key for SSL (default: '')"
  echo "    NEKO_PASSWORD          non-administrative password (default: 'neko')"
  echo "    NEKO_PASSWORD_ADMIN    the administrative password (default: 'admin')"
  echo "    RESTART                the restart policy for the container (default: 'always')"
  echo "    SHM_SIZE               shared memory size (default: '1gb')"
}

# Logic

## Argument parsing
while [[ "$1" != "" ]]; do
  case $1 in
    -h | --help ) usage
                  exit 0
                  ;;
    * )           usage
                  exit 1
  esac
  shift
done

install_container
run_container
