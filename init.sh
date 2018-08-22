#!/bin/bash

export LOCAL=`pwd`/local
mkdir -p $LOCAL
export LCG=/cvmfs/sft.cern.ch/lcg/views/LCG_89/x86_64-slc6-gcc62-opt

# to get gcc+binutils
source /cvmfs/sft.cern.ch/lcg/contrib/gcc/6.2binutils/x86_64-slc6/setup.sh

# to get cmake
export PATH=/cvmfs/sft.cern.ch/lcg/contrib/CMake/3.5.2/Linux-x86_64/bin/:${PATH}

# to get ROOT
source /cvmfs/sft.cern.ch/lcg/releases/ROOT/6.10.02-19565/x86_64-slc6-gcc62-opt/bin/thisroot.sh
export PATH=${PATH}:${ROOTSYS}/bin
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${ROOTSYS}/lib

# to get python
dpython=${LOCAL}/python
if [ -d $dpython ]; then
	export PATH=${dpython}/bin:${PATH}
	export LD_LIBRARY_PATH=${dpython}/lib:${LD_LIBRARY_PATH}
	export PYTHONPATH=${LCG}/lib/python2.7/site-packages:${PYTHONPATH}
	export PYTHONHOME=/cvmfs/sft.cern.ch/lcg/releases/Python/2.7.13-597a5/x86_64-slc6-gcc62-opt
fi

# to get clhep
dclhep=${LOCAL}/clhep
if [ -d $dclhep ]; then
	export LD_LIBRARY_PATH=${dclhep}/lib:${LD_LIBRARY_PATH}
fi

# to get xercesc
dxercesc=${LOCAL}/xercesc
if [ -d $dxercesc ]; then
	export LD_LIBRARY_PATH=${dxercesc}/lib:${LD_LIBRARY_PATH}
fi

# to get boost
dboost=${LOCAL}/boost
if [ -d $dboost ]; then
	export LD_LIBRARY_PATH=${dboost}/lib:${LD_LIBRARY_PATH}
fi

# to get tbb
dtbb=${LOCAL}/tbb
if [ -d $dtbb ]; then
	export LD_LIBRARY_PATH=${dtbb}/lib:${LD_LIBRARY_PATH}
fi

# to get gdb (& dependencies)
dgdb=${LOCAL}/gdb
if [ -d $dgdb ]; then
	export PATH=${dgdb}/bin:${PATH}
	export LD_LIBRARY_PATH=${dgdb}/lib:${LD_LIBRARY_PATH}
fi

# to get xrootd
dxrd=${LOCAL}/xrootd
if [ -d $dxrd ]; then
	export LD_LIBRARY_PATH=${dxrd}/lib64:${LD_LIBRARY_PATH}
fi
