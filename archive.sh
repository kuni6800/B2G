#!/bin/sh

. ${PWD}/.config

SRCDIR=${PWD}/out/target/product/${DEVICE}
TGTDIR=${PWD}/tmproot

rm -rf   ${TGTDIR}
mkdir -p ${TGTDIR}
cp -pr ${SRCDIR}/root    ${TGTDIR}/
cp -pr ${SRCDIR}/system  ${TGTDIR}/root/
cp -pr ${SRCDIR}/data    ${TGTDIR}/root/

echo 'pref("network.gonk.manage-offline-status", false);' >> ${TGTDIR}/root/system/b2g/defaults/pref/user.js
if [ -f     ${TGTDIR}/system/bin/oom-msg-logger ]; then
  chmod a+x ${TGTDIR}/system/bin/oom-msg-logger
fi

tar zcvf b2g-${DEVICE_NAME}-`date +"%Y%m%d"`.tar.gz -C ${TGTDIR} .

