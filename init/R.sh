#!/bin/bash
set -euo pipefail

PREFIX=R
VERSION=3.5.0
BASEINSTALL=/opt
THREADS=$(getconf _NPROCESSORS_ONLN)
WGET=wget --no-check-certificate
INSTALLDIR=${BASEINSTALL}/${PREFIX}-${VERSION}

## Build OpenMPI from source
TMPDIR=$(mktemp -d)

pushd ${TMPDIR} && [[ -w /opt ]] && {
	${WGET} https://cloud.r-project.org/src/base/R-3/R-${VERSION}.tar.gz 
	tar xvvf R-${VERSION}.tar.gz
} || exit 1

rm -rf ${TMPDIR}

exit 0
