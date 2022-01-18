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

setup_context() {
    pushd "$REPO"
    trap popd EXIT
    cur_branch=$(git rev-parse --abbrev-ref HEAD)
    trap "git checkout $cur_branch" EXIT
}

build_website() {
    TEMPDIR=$(mktemp -d)
    trap "rm -fr $TEMPDIR" EXIT
    echo "zola build output to $TEMPDIR"
    zola build --output-dir="$TEMPDIR"
}

git_add_and_push() {
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
build_website
git checkout master
git pull
cp -r "$TEMPDIR/*" ./
git_add_and_push
