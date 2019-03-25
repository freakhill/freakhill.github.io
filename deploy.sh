#!/usr/bin/env bash

## if this is the first time we clone this repo
## do: git submodule update --init --recursive

REPO="$1"

if [ -z "$REPO" ]
then
    SCRIPTDIR="$( cd "$(dirname "$0")" ; pwd -P )"
    TEMPFILE=$(mktemp)
    cp "$0" "$TEMPFILE"
    chmod +x "$TEMPFILE"
    exec "$TEMPFILE" "$SCRIPTDIR"
fi

set -e

cd "$REPO"
git checkout dev
TEMPDIR=$(mktemp -d)
zola build --output-dir="$TEMPDIR"

add_and_push() {
    git add -A
    if [[ -n $(git status -s) ]]
    then
        git commit -am autodeploy
        git push
    fi
}

add_and_push
git checkout master
git pull
cp -r $TEMPDIR/* ./
add_and_push
git checkout dev
