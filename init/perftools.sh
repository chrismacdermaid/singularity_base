#!/bin/bash
set -uoe pipefail

## Some useful real-world performance testing tools

REPO="https://github.com/brendangregg/perf-tools.git"
PREFIX=perf-tools
VERSION=`date +%Y-%m-%d`
BASEINSTALL=/opt
THREADS=$(getconf _NPROCESSORS_ONLN)

INSTALLDIR=${BASEINSTALL}/${PREFIX}-${VERSION}

git clone ${REPO} ${INSTALLDIR}

exit 0
