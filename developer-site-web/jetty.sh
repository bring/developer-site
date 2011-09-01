#!/bin/sh
MAVEN_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,address=8002,server=y,suspend=n -XX:MaxPermSize=356m -Xmx512m"

if [ -f /opt/jrebel/jrebel.jar ]; then
  if [ -z "$SKIP_JREBEL" ]; then
    echo "Enabling JRebel"
    MAVEN_OPTS="${MAVEN_OPTS} -noverify -javaagent:/opt/jrebel/jrebel.jar -Drebel.velocity_plugin=true -Drebel.log4j-plugin=true"
  fi
fi

export MAVEN_OPTS
mvn jetty:run -o -DCONSTRETTO_TAGS=dev $@
