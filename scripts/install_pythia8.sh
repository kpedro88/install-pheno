#!/bin/bash

source init.sh

SOURCEDIR=pythia8226
INSTALLDIR=$LOCAL/pythia8/install

if [ -d $INSTALLDIR ]; then
    rm -rf $INSTALLDIR
fi

if [ "$FORCERECOMP" = "true" ]; then
	rm -rf $SOURCEDIR
fi

if ! [ -d $SOURCEDIR ]; then
	wget -q http://home.thep.lu.se/~torbjorn/pythia8/pythia8226.tgz
	tar -xzf pythia8226.tgz
	rm pythia8226.tgz
fi

cd $SOURCEDIR

DEBUGFLAGPYTHIA=""
if [ -n "$DEBUGFLAG" ]; then
	DEBUGFLAGPYTHIA=--enable-debug
fi

./configure $DEBUGFLAGPYTHIA --prefix=$INSTALLDIR --enable-shared --with-hepmc2=$LOCAL/hepmc/install
make -j $1
make install

