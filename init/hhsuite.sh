#!/bin/bash
set -euo pipefail

REPO="https://github.com/soedinglab/hh-suite.git"
PREFIX=hhsuite
VERSION=`date +%Y-%m-%d`
BASEINSTALL=/opt
THREADS=$(getconf _NPROCESSORS_ONLN)

INSTALLDIR=${BASEINSTALL}/${PREFIX}-${VERSION}

## Build OpenMPI from source
TMPDIR=$(mktemp -d)

pushd ${TMPDIR} && [[ -w /opt ]] && {
	git clone ${REPO} .
        git submodule init
	git submodule update
	mkdir build && pushd build
	cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo\
	-G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=${INSTALLDIR} ..
	make
	make install
	popd; popd
} || exit 1

rm -rf ${TMPDIR}

exit 0
