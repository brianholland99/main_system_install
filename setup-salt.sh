#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 MINION_ID"
    exit 1
fi
HOSTNAME=$1
SALT_PKI=/etc/salt/pki
MIN_KEY_DIR=${SALT_PKI}/minion

#### Get bootstrap_salt.sh
curl -o bootstrap_salt.sh -L https://bootstrap.saltstack.com
sh bootstrap_salt.sh -M -N  # Install just master.  This includes salt-key.
mkdir ${MIN_KEY_DIR}  # Master install did not create this dir.
salt-key --gen-keys-dir=${MIN_KEY_DIR} --gen-keys=minion
## Now pre-seed master
cp ${MIN_KEY_DIR}/minion.pub ${SALT_PKI}/master/minions/${HOSTNAME}
## Install minion
sh bootstrap_salt.sh -i ${HOSTNAME} -A 127.0.0.1
rm bootstrap_salt.sh
