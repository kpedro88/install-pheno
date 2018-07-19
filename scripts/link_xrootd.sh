#!/bin/bash

source init.sh

LIBS=(
libXrdAppUtils.so \
libXrdAppUtils.so.1 \
libXrdAppUtils.so.1.0.0 \
libXrdBlacklistDecision-4.so \
libXrdBwm-4.so \
libXrdCksCalczcrc32-4.so \
libXrdClient.so \
libXrdClient.so.2 \
libXrdClient.so.2.0.0 \
libXrdCl.so \
libXrdCl.so.2 \
libXrdCl.so.2.0.0 \
libXrdCryptoLite.so \
libXrdCryptoLite.so.1 \
libXrdCryptoLite.so.1.0.0 \
libXrdCrypto.so \
libXrdCrypto.so.1 \
libXrdCrypto.so.1.0.0 \
libXrdCryptossl-4.so \
libXrdFfs.so \
libXrdFfs.so.2 \
libXrdFfs.so.2.0.0 \
libXrdFileCache-4.so \
libXrdHttp-4.so \
libXrdOssSIgpfsT-4.so \
libXrdPosixPreload.so \
libXrdPosixPreload.so.1 \
libXrdPosixPreload.so.1.0.0 \
libXrdPosix.so \
libXrdPosix.so.2 \
libXrdPosix.so.2.0.0 \
libXrdPss-4.so \
libXrdSec-4.so \
libXrdSecgsi-4.so \
libXrdSecgsiAUTHZVO-4.so \
libXrdSecgsiGMAPDN-4.so \
libXrdSecgsiGMAPLDAP-4.so \
libXrdSeckrb5-4.so \
libXrdSecProt-4.so \
libXrdSecpwd-4.so \
libXrdSecsss-4.so \
libXrdSecunix-4.so \
libXrdServer.so \
libXrdServer.so.2 \
libXrdServer.so.2.0.0 \
libXrdThrottle-4.so \
libXrdUtils.so \
libXrdUtils.so.2 \
libXrdUtils.so.2.0.0 \
libXrdXml.so \
libXrdXml.so.2 \
libXrdXml.so.2.0.0 \
libXrdXrootd-4.so \
)

# link xrootd
XRDDIR=${LOCAL}/xrootd
mkdir ${XRDDIR}
mkdir ${XRDDIR}/lib64
for LIB in ${LIBS[@]}; do
	ln -s ${LCG}/lib64/${LIB} ${XRDDIR}/lib64/${LIB}
done

