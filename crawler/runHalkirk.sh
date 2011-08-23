#!/bin/bash
sed -e 's|xSERVERx|halkirk.os.ergo.no:8889,halkirk.os.ergo.no:8082|g' -e 's|xFRAKTGUIDEx|halkirk.os.ergo.no:8889|' -e 's|xUSERx|fraktguideAdmin|' morebot.xml.template > morebot.xml

echo
echo "Fraktguide Morebot Crawler test that looks for broken links and HTTP error codes when following links. Assuming halkirk is up at 8889."
echo

sh run_delegate.sh
