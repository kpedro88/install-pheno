set SCRIPT_DIR=/cvmfs/sft.cern.ch/lcg/releases/binutils/2.28-19981/x86_64-slc6-gcc62-opt/setup.csh
set srcpath=`readlink -f $SCRIPT_DIR`
set BASE=`dirname $srcpath`
set PLATFORM=x86_64-slc6-gcc62-opt



set __PKG_NAME=binutils
set __PKG_VERSION=2.28
set __PKG_HASH=19981

# Export environmental variables
setenv PATH $BASE/bin:$PATH
setenv MANPATH $BASE/man:$MANPATH

if ( $?LD_LIBRARY_PATH ) setenv LD_LIBRARY_PATH ":${LD_LIBRARY_PATH}"
if ( -d $BASE/lib64 ) setenv LD_LIBRARY_PATH ":${BASE}/lib64${LD_LIBRARY_PATH}"
setenv LD_LIBRARY_PATH ${BASE}/lib${LD_LIBRARY_PATH}

# Export package specific environmental variables
