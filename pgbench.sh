#!/bin/sh

  set -e

# load config file

  . ./.factoryrc

# PostgreSQL benchmark

  [ ! -d ./${LOG_DIR} ] && mkdir ./${LOG_DIR}

  pgbench() {
      ${PGBENCH} -c ${CLIENT} -t ${TRANSACTION} -h ${HOST} -p ${PORT} -U ${USER} ${BENCH_OPTION} ${DB}
  }

  for count in $( seq ${TRY} )
  do
      echo -n "${count} "
      pgbench | grep "excluding" | awk '{ print $3 }'

      sleep 1
  done >${BENCH_LOG}

  echo "pgbench Finishd!"
