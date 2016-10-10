#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 CONFIG_FILE"
    exit 1
fi

source $1

ISO_LINUX=${TMP_DIR}/custom_iso/isolinux

# Clear out any previous work
/bin/rm -rf ${TMP_DIR}
mkdir -p ${TMP_DIR}/iso 
# Mount the ISO.  It will be read-only.
mount -o loop ${BASE_ISO} ${TMP_DIR}/iso
cp -r ${TMP_DIR}/iso ${TMP_DIR}/custom_iso  # Make copy to modify
umount ${TMP_DIR}/iso
rmdir ${TMP_DIR}/iso

# Now customize the copy
echo ${BOOT_LANG} > ${ISO_LINUX}/lang
# Add boot menu option.
cat ${NEW_TXT_DATA} >> ${ISO_LINUX}/txt.cfg
# Set boot default option
sed -i "s/default install/default ${BOOT_DEFAULT}/" ${ISO_LINUX}/txt.cfg

sed -i "s/^timeout 0$/timeout ${BOOT_TIMEOUT}/" ${ISO_LINUX}/isolinux.cfg

cp ${PRESEED_FILES} ${TMP_DIR}/custom_iso/preseed/

cd ${TMP_DIR}/custom_iso
mkisofs -r -V "UBUNTU1604" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ../ubuntu-16.04.1-server-amd64-autoinstall.iso .

