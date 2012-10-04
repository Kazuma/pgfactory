#!/bin/sh

  set -e

# load config file

  . ./.factoryrc

# PostgreSQL benchmark

  [ ! -d ./${LOG_DIR} ] && mkdir ./${LOG_DIR}

  COUNT=0

  while [ $COUNT -ne $TRY ]
  do
    COUNT=`expr $COUNT + 1`
    echo -n "${COUNT}  "
    $PGBENCH -c $CLIENT -t $TRANSACTION -h $HOST -p $PORT -U $USER $BENCH_OPTION $DB | grep "excluding" | awk '{print $3}'
    sleep 1
  done >$BENCH_LOG

  echo "pgbench Finishd!"
