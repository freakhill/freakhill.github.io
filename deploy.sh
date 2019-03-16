#!/usr/bin/env bash

REPO="$1"

if [ -z "$REPO" ]
then
    git add -A
    git commit -am autodeploy
    git push
    SCRIPTDIR="$( cd "$(dirname "$0")" ; pwd -P )"
    TEMPFILE=$(mktemp)
    cp "$0" "$TEMPFILE"
    chmod +x "$TEMPFILE"
    exec "$TEMPFILE" "$SCRIPTDIR"
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
