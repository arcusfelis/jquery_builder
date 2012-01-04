#!/bin/sh

URL="http://code.jquery.com/jquery.min.js"
DIR="/home/builder/jquery-latest"
COMMENT="Push latest version at $(date -u)."

set -e 

cd "$DIR"

DEST_FILE="$(mktemp)"
wget "${URL}" -O "${DEST_FILE}"

mv "${DEST_FILE}" "./jquery.min.js"

git add .
git commit -m "${COMMENT}"
git push

set -e
