#!/bin/bash
truncate --size 0 TimeLog.csv
echo "CPU$(head -n 5 /proc/cpuinfo | tail -n 1 | cut -d ':' -f 2)" >> TimeLog.csv
uname -a  >> TimeLog.csv
echo >> TimeLog.csv

TIMEFORMAT="real %R user %U system %S"
for PROGRAM in bench_*; do
	echo "Running $PROGRAM..."
	truncate --size 0 bench.log
	echo $PROGRAM >> MemLog.csv	
	#truncate --size 0 MemLog.csv
	
	for i in {1..10}; do		
		(time ./$PROGRAM) 2>> bench.log				
	done
	
	echo $PROGRAM >> TimeLog.csv
	
	awk '
		    { r += $2; u += $4; s += $6; }
		END { printf("average real %.3f user %.3f system %.3f\n", r / NR, u / NR, s / NR); }
	' bench.log  >> TimeLog.csv
	cat bench.log >> TimeLog.csv
		
	echo >> MemLog.csv
	#cat ps.log >> MemLog.csv
	 		
done
echo >> TimeLog.csv
#cat /proc/cpuinfo >> results.log

rm -f bench.log
rm -f ps.log
rm -f test.txt
