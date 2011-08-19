#!/bin/sh
#. /lib/lsb/functions.sh
# Set working dir to LOGS
cd ${prefix}/logs/${app_name}

if [[ $cmd == 'start' ]]; then

    if [[ -f ${prefix}/logs/${app_name}/${app_name}.pid ]]; then
        echo "Already running"
        exit 0
    fi
    if [[ -f ${prefix}/apps/${app_name}/${app_name}.jar ]]; then
        echo "Starting jetty"
        java ${java_args} -jar ${prefix}/apps/${app_name}/${app_name}.jar start \
             1>${prefix}/logs/${app_name}/stdout.log \
             2>${prefix}/logs/${app_name}/stderr.log &
        pid=$!
        echo "$pid" > ${prefix}/logs/${app_name}/${app_name}.pid
        echo "Started ${app_name} with pid: ${pid}"
        exit 0
    fi

elif [[ $cmd == 'stop' ]]; then

    # Try gracefully first
    java ${java_args} -jar ${prefix}/apps/${app_name}/${app_name}.jar stop
    sleep 3
    if [[ -f ${prefix}/logs/${app_name}/${app_name}.pid ]]; then
        pid=`cat ${prefix}/logs/${app_name}/${app_name}.pid`
        test -z $pid || kill $pid
        rm ${prefix}/logs/${app_name}/${app_name}.pid
        sleep 1
        echo "Stopped ${app_name} with pid: ${pid}"
    fi
    exit 0
else
    echo "Usage: $0 <start|stop>"
fi
