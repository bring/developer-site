#!/bin/bash

echo "Running test......."
echo

java -jar morebot.jar > crawler_output.log

return_code=$?
if [ $return_code -ne 0 ] ; then
    exit 1
fi

cat crawler_output.log

num_failures=`grep -ic "fail\|exception" crawler_output.log`

echo "Number of failure indicators:" $num_failures

if [ $num_failures -ne 0 ] ; then
    echo "Crawler tests failed!"
    exit 1
fi
