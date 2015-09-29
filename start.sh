#!/bin/bash

source "./welcome.sh"
pattern="/usr/share/spark/latest/logs/*.out"
logs=( $pattern )

if [ "$1" == "master" ]; then
    echo 'starting master'
    start-master.sh
    `tail -f -n 100 ${logs[0]}`
elif [ "$1" == "worker" ]; then
    echo 'starting worker'
    start-slave.sh $2
    `tail -f -n 100 ${logs[0]}`
else
    exec "$@"
fi
