#!/bin/bash
sed -e 's|xSERVERx|local.bring.no:8082|g' -e 's|xFRAKTGUIDEx|local.bring.no:8080|' morebot.xml.template > morebot.xml

echo
echo "Fraktguide Morebot Crawler test that looks for broken links and HTTP error codes when following links. Assuming localhost is up at 8080."
echo

sh run_delegate.sh
