#!/bin/bash
set -euo pipefail

REPO="https://github.com/open-mpi/ompi.git"
PREFIX=openmpi
VERSION=2.1.3
BASEINSTALL=/opt
THREADS=$(getconf _NPROCESSORS_ONLN)

## Build OpenMPI from source
TMPDIR=$(mktemp -d)

pushd ${TMPDIR} && [[ -w /opt ]] && {
	git clone ${REPO} .
	git checkout "v${VERSION}" &&\
	perl autogen.pl &&\
	./configure --prefix=${BASEINSTALL}/${PREFIX}-${VERSION} &&\
	make -j ${THREADS} &&\
	make install
	popd
} || exit 1

rm -rf ${TMPDIR}

exit 0
