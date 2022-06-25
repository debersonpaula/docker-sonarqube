#!/bin/bash

function runCommand {
    cmd=$1
    msg=$2
    exitonfail=$3

    echo "-----------------------------------------------"
    echo "[RUN]: $msg"
    $cmd
    status=$?
    if [ ! $status -eq 0 ]; then
        if ((exitonfail == true)); then
            exit 1
        fi
    fi
}
