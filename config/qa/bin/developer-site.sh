#!/bin/sh
export prefix=/u01/bring_qa
export port=7011
export app_name=developer-site
export context_path=/
export shutdown_secret=2f689efd2e4e9a8e7befeeaaaa0c678e
export CONSTRETTO_TAGS=production
export java_args="-Djetty.port=${port} -Djetty.contextPath=${context_path} -Djetty.shutdownSecret=${shutdown_secret} -DCONSTRETTO_TAGS=${CONSTRETTO_TAGS}"

export cmd=$1

. ${prefix}/bin/jetty.sh

exit 1
