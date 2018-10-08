SCRIPT_DIR=/cvmfs/sft.cern.ch/lcg/contrib/gcc/6.2binutils/x86_64-slc6-gcc62-opt/setup.sh

BASE=$(dirname $(readlink -f $SCRIPT_DIR))
PLATFORM=x86_64-slc6-gcc62-opt



# Source dependencies
BASE_STACK="${BASE} ${BASE_STACK}" # Add element to stack

source binutils.sh

BASE=$(echo $BASE_STACK | cut -f1 -d' ' ) # Restore BASE 

BASE_STACK=$(echo $BASE_STACK | cut -f2- -d' ') # Remove last element from stack

__PKG_NAME=gcc
__PKG_VERSION=6.2.0
__PKG_HASH=2bc78

# Export environmental variables
export PATH=$BASE/bin:$PATH
export MANPATH=$BASE/man:$MANPATH

if [ -e "${BASE}/lib64" ]; then
    # Add lib64 if exists
    export LD_LIBRARY_PATH="$BASE/lib64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi
if [ -e "${BASE}/lib" ]; then
    # Add lib if exists
    export LD_LIBRARY_PATH="$BASE/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi

# Export package specific environmental variables

export COMPILER_PATH="$BASE/lib/gcc/x86_64-pc-linux-gnu/${__PKG_VERSION}"

export FC=`which gfortran`
export CC=`which gcc`
export CXX=`which g++`
