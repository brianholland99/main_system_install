#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 MINION_ID"
    exit 1
fi
MINION_ID=$1
SALT_PKI=/etc/salt/pki
MIN_KEY_DIR=${SALT_PKI}/minion
MASTER_MINS_KEY_DIR=${SALT_PKI}/master/minions

wget -O bootstrap-salt.sh https://bootstrap.saltstack.com
sh bootstrap-salt.sh -M -N

mkdir -p ${MIN_KEY_DIR}  # Master install did not create this dir.
salt-key --gen-keys-dir=${MIN_KEY_DIR} --gen-keys=minion

# Now pre-seed master
cp ${MIN_KEY_DIR}/minion.pub ${SALT_PKI}/master/minions/${MINION_ID}

# Install minion
sh bootstrap-salt.sh -i bhdesk -A 127.0.0.1
rm bootstrap-salt.sh
