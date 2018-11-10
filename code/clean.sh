#!/bin/sh

for PROGRAM in bench_*; do
	
	rm -rf $PROGRAM
done

	rm -rf TimeLog.csv
	rm -rf ps.log
	rm -rf MemLog.csv
	rm -rf test.txt
