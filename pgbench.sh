#!/bin/sh

set -e

# load config file

  . ../.factoryrc


# PostgreSQL benchmark

  COUNT=0

  while [ $COUNT -ne 12 ]
  do
    COUNT=`expr $COUNT + 1`
    echo -n "${COUNT}  "
    $PGBENCH -c $CLIENT -t $TRANSACTION -h $HOST -p $PORT -U $USER $DB | grep "excluding" | awk '{print $3}'
    sleep 2
  done >$BENCH_LOG

  echo "pgbench Finishd!"
