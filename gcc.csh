set SCRIPT_DIR=/cvmfs/sft.cern.ch/lcg/contrib/gcc/6.2binutils/x86_64-slc6-gcc62-opt/setup.csh
set srcpath=`readlink -f $SCRIPT_DIR`
set BASE=`dirname $srcpath`
set PLATFORM=x86_64-slc6-gcc62-opt


# Source dependencies

if ( ! $?BASE_STACK ) set BASE_STACK=""
set BASE_STACK="${BASE} ${BASE_STACK}" # Add element to stack

source binutils.csh

set BASE=`echo $BASE_STACK | cut -f1 -d' ' ` # Restore BASE 

set BASE_STACK=`echo $BASE_STACK | cut -f2- -d' '` # Remove last element from stack

set __PKG_NAME=gcc
set __PKG_VERSION=6.2.0
set __PKG_HASH=2bc78

# Export environmental variables
setenv PATH $BASE/bin:$PATH
setenv MANPATH $BASE/man:$MANPATH

if ( $?LD_LIBRARY_PATH ) setenv LD_LIBRARY_PATH ":${LD_LIBRARY_PATH}"
if ( -d $BASE/lib64 ) setenv LD_LIBRARY_PATH ":${BASE}/lib64${LD_LIBRARY_PATH}"
setenv LD_LIBRARY_PATH ${BASE}/lib${LD_LIBRARY_PATH}

# Export package specific environmental variables

setenv COMPILER_PATH "$BASE/lib/gcc/x86_64-pc-linux-gnu/${__PKG_VERSION}"

setenv FC `which gfortran`
setenv CC `which gcc`
setenv CXX `which g++`
