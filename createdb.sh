#!/bin/sh

set -e

# load config file

  . ./.factoryrc

# create database

  ${CREATEDB} -h ${HOST} -U ${USER} -p ${PORT} ${DB}
