#!/bin/bash

source init.sh

SOURCEDIR=Delphes-3.4.1
INSTALLDIR=$LOCAL/delphes/install

if [ -d $INSTALLDIR ]; then
    rm -rf $INSTALLDIR
fi

if [ "$FORCERECOMP" = "true" ]; then
	rm -rf $SOURCEDIR
fi

if ! [ -d $SOURCEDIR ]; then
	wget -q http://cp3.irmp.ucl.ac.be/downloads/Delphes-3.4.1.tar.gz
	tar -xzf Delphes-3.4.1.tar.gz
	rm Delphes-3.4.1.tar.gz
fi

cd $SOURCEDIR
mkdir build
cd build

cmake ../ $DEBUGFLAG -DCMAKE_INSTALL_PREFIX=$INSTALLDIR -DROOT_DIR=$ROOTSYS/cmake
make -j $1
make install

