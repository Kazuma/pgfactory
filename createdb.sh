#!/bin/sh

set -e

# load config file

  . ../.factoryrc

# create database

  $CREATEDB $HOST $USER $PORT $DB
