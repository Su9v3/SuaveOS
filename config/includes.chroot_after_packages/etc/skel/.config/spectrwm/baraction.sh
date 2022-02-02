#!/bin/bash

datetime() {
	datetime=$(date)
	echo -e "${datetime}"
}

# System uptime
sysut() {
	ut=$(uptime -p | cut -c 4-)
	echo -e "Uptime: ${ut}"
}

# CPU operation frequency of single core
cpu() {
	speed=$(top -bn1 | grep '%Cpu' | tail -1 | grep -P '(....|...) id,'|awk '{print "CPU Usage (Single Core): " 100-$8 "%"}')
	echo -e "${speed}"
}

ram(){
	ramused=$(free | awk '/Mem/ {used = $3*1000000; total = $2*1000000; print used " / " total}')
	echo -e "Ram (Total / Used): $ramused"
}

SLEEP_SEC=1.0

while :; do
	echo "[$(cpu)] [$(ram)] [$(sysut)] [$(datetime)]"
	sleep $SLEEP_SEC
done
