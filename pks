#!/bin/bash
# SPDX-License-Identifier: EPL-2.0
# Copyright 2017 DaSoftver LLC.

#./pks [git-pwd]
# git-pwd is to run it non-interactively

#
#Do NOT run this script unless you are upstream developer! Internal use only.
#
#get the part that deals with signing of packages,changelog and version for the
#official Vely release.
#

set -eE -o functrace
trap 'echo "Error: status $?, $(caller), line ${LINENO}"' ERR

if [ ! -d "$(pwd)/rv" ]; then
    rm -rf rv
    mkdir -p rv
    cd rv
    if [ "$1" != "" ]; then
        git clone https://dasoftver:$1@bitbucket.org/dasoftver/private_vely.git .
    else
        git clone https://dasoftver@bitbucket.org/dasoftver/private_vely.git .
    fi
    cd ..
fi 

rv/pks
