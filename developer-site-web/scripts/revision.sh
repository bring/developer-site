#!/bin/bash

BRANCHES=$(git show -s --pretty=%d HEAD)
REVISION=$(git log --format=format:"%H %ci" -1)
echo "$REVISION $BRANCHES"
