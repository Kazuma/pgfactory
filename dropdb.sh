#!/bin/sh

set -e

# load config file

  . ./.factoryrc

# drop database

  ${DROPDB} --host=${HOST} --port=${PORT} --username=${USER} ${DB}
