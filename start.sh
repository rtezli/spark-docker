#!/bin/bash

# source "/welcome.sh"

if [ "$1" == "master" ]; then
    echo 'starting master'
    $SPARK_HOME/sbin/start-master.sh
elif [ "$1" == "worker" ]; then
    echo 'starting slave'
    $SPARK_HOME/sbin/start-slave.sh $2
else
    exec "$@"
fi

exec "bash"
