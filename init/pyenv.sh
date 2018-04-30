#!/bin/bash
set -uoe pipefail

REPO="https://github.com/pyenv/pyenv.git"
PREFIX=pyenv
VERSION=`date +%Y-%m-%d`
BASEINSTALL=/opt
THREADS=$(getconf _NPROCESSORS_ONLN)

INSTALLDIR=${BASEINSTALL}/${PREFIX}-${VERSION}

git clone ${REPO} ${INSTALLDIR} && {
	echo "export PYENV_ROOT=${INSTALLDIR}"     >> ~/.bash_profile
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
	echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
} || exit 1

exit 0
