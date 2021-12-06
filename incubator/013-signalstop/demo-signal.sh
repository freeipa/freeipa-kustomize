#!/bin/bash

function trap_sigint { echo "Exiting by SIGINT";  exit 0; }
function trap_sigterm { echo "Exiting by SIGTERM"; exit 0; }
function trap_sigusr1 { echo "Exiting by SIGUSR1"; exit 0; }
function trap_sigrtmin3 { echo "Exiting by SIGRTMIN+3"; exit 0; }

trap trap_sigint SIGINT
trap trap_sigterm SIGTERM
trap trap_sigusr1 SIGUSR1
trap trap_sigrtmin3 "SIGRTMIN+3"

while true; do sleep 1; done
