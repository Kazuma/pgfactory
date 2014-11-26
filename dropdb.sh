#!/bin/sh

set -e

# load config file

  . ./.factoryrc

# drop database

  ${DROPDB} -h ${HOST} -U ${USER} -p ${PORT} ${DB}
