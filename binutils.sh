set SCRIPT_DIR=/cvmfs/sft.cern.ch/lcg/releases/binutils/2.28-19981/x86_64-slc6-gcc62-opt/setup.sh
BASE=$(dirname $(readlink -f $SCRIPT_DIR))
PLATFORM=x86_64-slc6-gcc62-opt



# Source dependencies
BASE_STACK="${BASE} ${BASE_STACK}" # Add element to stack

BASE_STACK=$(echo $BASE_STACK | cut -f2- -d' ') # Remove last element from stack

__PKG_NAME=binutils
__PKG_VERSION=2.28
__PKG_HASH=19981

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
