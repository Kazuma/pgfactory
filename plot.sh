#! /bin/sh

. ../.factoryrc

gnuplot <<EOF
set ylabel "TPS"
set key width 5 right box
set title "Benchmark"
plot "${LOG_DIR}/${BENCH_LOG}" with linespoint lw 1 pt 2 ps 1
pause 1000
EOF
