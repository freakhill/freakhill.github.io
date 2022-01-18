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


# appends a command to a trap
#
# - 1st arg:  code to add
# - remaining args:  names of traps to modify
#
trap_add() {
    trap_add_cmd=$1; shift || fatal "${FUNCNAME} usage error"
    for trap_add_name in "$@"; do
        trap -- "$(
            # helper fn to get existing trap command from output
            # of trap -p
            extract_trap_cmd() { printf '%s\n' "$3"; }
            # print existing trap command with newline
            eval "extract_trap_cmd $(trap -p "${trap_add_name}")"
            # print the new trap command
            printf '%s\n' "${trap_add_cmd}"
        )" "${trap_add_name}" \
            || fatal "unable to add to trap ${trap_add_name}"
    done
}
# set the trace attribute for the above function.  this is
# required to modify DEBUG or RETURN traps because functions don't
# inherit them unless the trace attribute is set
declare -f -t trap_add


function setup_context() {
    pushd "$REPO"
    trap_add popd EXIT
    cur_branch=$(git rev-parse --abbrev-ref HEAD)
    trap_add "git checkout $cur_branch" EXIT
}

function build_website() {
    tempdir="$1"
    trap_add "rm -fr $tempdir" EXIT
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
cp -r "$tempdir"/* ./
git_add_and_push
