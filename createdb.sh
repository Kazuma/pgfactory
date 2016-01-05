#!/bin/sh

set -e

# load config file

  . ./.factoryrc

# create database

  ${CREATEDB} --host=${HOST} --port=${PORT} --username=${USER} ${DB}

# initialize pgbench

  ${PGBENCH} --initialize --scale=${SCALE_FACTOR} --fillfactor=${FILLFACTOR} --host=${HOST} --port=${PORT} --username=${USER} ${DB}
