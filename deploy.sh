#!/usr/bin/env bash

REPO="$1"

if [ -z "$REPO" ]
then
    SCRIPT="$( cd "$(dirname "$0")" ; pwd -P )"
    TEMPFILE=$(mktemp)
    cp "$SCRIPT" "$TEMPFILE"
    chmod +x "$TEMPFILE"
    REPO=$(dirname "$SCRIPT")
    exec "$TEMPFILE" "$REPO"
fi

cd "$REPO"
git checkout dev
TEMPDIR=$(mktemp -d)
zola build --output-dir="$TEMPDIR"
git checkout master
cp -r "$TEMPDIR/" ./
git add -A
git commit -am "autodeploy"
git push
git checkout dev
