#!/bin/sh

set -e

# load config file

  . ./.factoryrc

# create database

  ${CREATEDB} -h ${HOST} -U ${USER} -p ${PORT} ${DB}

# initialize pgbench

  ${PGBENCH} -i -s ${SCALE_FACTOR} -F ${FILLFACTOR} -h ${HOST} -U ${USER} -p ${PORT} ${DB}
