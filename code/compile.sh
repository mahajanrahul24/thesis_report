#!/bin/sh

for PROGRAM in *.c; do

	gcc  $PROGRAM -o bench_${PROGRAM%%.c} -lpthread
done
