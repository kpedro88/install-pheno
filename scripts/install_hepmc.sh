#!/bin/bash

source init.sh

SOURCEDIR=hepmc2.06.09
INSTALLDIR=$LOCAL/hepmc/install

if [ -d $INSTALLDIR ]; then
    rm -rf $INSTALLDIR
fi

if [ "$FORCERECOMP" = "true" ]; then
	rm -rf $SOURCEDIR
fi

if ! [ -d $SOURCEDIR ]; then
	wget -q http://hepmc.web.cern.ch/hepmc/releases/hepmc2.06.09.tgz
	tar -xzf hepmc2.06.09.tgz
	rm hepmc2.06.09.tgz
fi

BUILDDIR=build_$SOURCEDIR

if [ -d $BUILDDIR ]; then
	rm -rf $BUILDDIR
fi

mkdir $BUILDDIR
cd $BUILDDIR
cmake ../$SOURCEDIR $DEBUGFLAG -DCMAKE_INSTALL_PREFIX=$INSTALLDIR -DROOT_DIR=$ROOTSYS/cmake -Dmomentum:STRING=GEV -Dlength:STRING=MM
make -j $1
make install

