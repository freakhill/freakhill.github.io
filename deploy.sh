#!/usr/bin/env bash

## if this is the first time we clone this repo
## do: git submodule update --init --recursive


###################################################
# startup trick

if [ -z "$1" ]
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
REPO="$1"

function setup_context() {
    pushd "$REPO"
    trap popd EXIT
    cur_branch=$(git rev-parse --abbrev-ref HEAD)
    trap "git checkout $cur_branch" EXIT
}

function build_website() {
    tempdir="$1"
    trap "rm -fr $tempdir" EXIT
    echo "zola build output to $tempdir"
    zola build --output-dir="$tempdir"

}

function git_add_and_push() {
    git add -A
    if [[ -n $(git status -s) ]]
    then
        git commit -am "autopush changes (deploy scripts)"
        git push
    fi
}

setup_context
git_add_and_push
git checkout dev
tempdir=$(mktemp -d)
build_website "$tempdir"
git checkout master
git pull
cp -r "$tempdir/*" ./
git_add_and_push
