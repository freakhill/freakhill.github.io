#!/usr/bin/env bash

## if this is the first time we clone this repo
## do: git submodule update --init --recursive


###################################################
# startup trick
REPO="$1"

if [ -z "$REPO" ]
then
    SCRIPTDIR="$( cd "$(dirname "$0")" ; pwd -P )"
    TEMPFILE=$(mktemp)
    trap "rm -fr $TEMPFILE" EXIT
    cp "$0" "$TEMPFILE"
    chmod +x "$TEMPFILE"
    exec "$TEMPFILE" "$SCRIPTDIR"
fi
###################################################

set -e
# with the startup trick we ensured that $REPO is valid~ish
cd "$REPO"
git checkout dev
TEMPDIR=$(mktemp -d)
trap "rm -fr $TEMPDIR" EXIT
echo "zola build output to $TEMPDIR"
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
trap "git checkout dev" EXIT
git pull
cp -r "$TEMPDIR/*" ./
add_and_push
