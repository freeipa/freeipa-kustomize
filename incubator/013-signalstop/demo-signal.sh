#!/bin/bash

function trap_signal {
  local signal="$1"
  echo -e "\nExiting by ${signal}" >&2
  exit 0
}

for signal in SIGINT SIGTERM SIGUSR1 "SIGRTMIN+3"
do
  trap "trap_signal '${signal}'" "${signal}"
done

while true; do
    echo -n "."
    sleep 1
done
