#!/bin/tcsh

setenv LOCAL `pwd`/local
mkdir -p $LOCAL
setenv LCG /cvmfs/sft.cern.ch/lcg/views/LCG_89/x86_64-slc6-gcc62-opt

# to get gcc+binutils (hacked scripts b/c issues introduced by late modification of LCG packages)
source gcc.csh

# to get cmake
setenv PATH /cvmfs/sft.cern.ch/lcg/contrib/CMake/3.5.2/Linux-x86_64/bin/:${PATH}

# to get ROOT
source /cvmfs/sft.cern.ch/lcg/releases/ROOT/6.10.02-19565/x86_64-slc6-gcc62-opt/bin/thisroot.csh
setenv PATH ${PATH}:${ROOTSYS}/bin
setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${ROOTSYS}/lib

# to get Delphes
set ddelphes=${LOCAL}/delphes/install
if ( -d $ddelphes ) then
	setenv PATH ${ddelphes}/bin:${PATH}
	setenv LD_LIBRARY_PATH ${ddelphes}/lib:${LD_LIBRARY_PATH}
	setenv ROOT_INCLUDE_PATH ${ddelphes}/include
endif

# to get python
set dpython=${LOCAL}/python
if ( -d $dpython ) then
	setenv PATH ${dpython}/bin:${PATH}
	setenv LD_LIBRARY_PATH ${dpython}/lib:${LD_LIBRARY_PATH}
	setenv PYTHONPATH ${LCG}/lib/python2.7/site-packages:${PYTHONPATH}
	setenv PYTHONHOME /cvmfs/sft.cern.ch/lcg/releases/Python/2.7.13-597a5/x86_64-slc6-gcc62-opt
endif

# to get clhep
set dclhep=${LOCAL}/clhep
if ( -d $dclhep ) then
	setenv LD_LIBRARY_PATH ${dclhep}/lib:${LD_LIBRARY_PATH}
endif

# to get xercesc
set dxercesc=${LOCAL}/xercesc
if ( -d $dxercesc ) then
	setenv LD_LIBRARY_PATH ${dxercesc}/lib:${LD_LIBRARY_PATH}
endif

# to get boost
set dboost=${LOCAL}/boost
if ( -d $dboost ) then
	setenv LD_LIBRARY_PATH ${dboost}/lib:${LD_LIBRARY_PATH}
endif

# to get tbb
set dtbb=${LOCAL}/tbb
if ( -d $dtbb ) then
	setenv LD_LIBRARY_PATH ${dtbb}/lib:${LD_LIBRARY_PATH}
endif

# to get gdb (& dependencies)
set dgdb=${LOCAL}/gdb
if ( -d $dgdb ) then
	setenv PATH ${dgdb}/bin:${PATH}
	setenv LD_LIBRARY_PATH ${dgdb}/lib:${LD_LIBRARY_PATH}
endif

# to get xrootd
set dxrd=${LOCAL}/xrootd
if ( -d $dxrd ) then
	setenv LD_LIBRARY_PATH ${dxrd}/lib64:${LD_LIBRARY_PATH}
endif
