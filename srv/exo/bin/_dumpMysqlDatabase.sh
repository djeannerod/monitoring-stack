#!/bin/bash -eu

# #############################################################################
# Initialize
# #############################################################################                                              
SCRIPT_NAME="${0##*/}"
SCRIPT_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 

# Load env settings
source ${SCRIPT_DIR}/_setenv-template.sh
# Load common functions
source ${SCRIPT_DIR}/_functions.sh

DUMP_OPTIONS="--single-transaction"

# Initialize working directory
mkdir -p ${BACKUP_WORKING_DIR}/tmp_db
rm -rf ${BACKUP_WORKING_DIR}/tmp_db/*
pushd ${BACKUP_WORKING_DIR}/tmp_db > /dev/null 2>&1

echo "[INFO] ======================================="
echo "[INFO] = Dumping database ${PLF_DATABASE_NAME} into ${BACKUP_WORKING_DIR}/tmp_db ..."
echo "[INFO] ======================================="
echo "[INFO] $(display_date)"

display_time sudo mysqldump ${DUMP_OPTIONS} ${PLF_DATABASE_NAME} > ${BACKUP_WORKING_DIR}/tmp_db/${PLF_DATABASE_NAME}-dumpDataBase.sql

echo "[INFO] $(display_date)"
echo "[INFO] Done"

popd > /dev/null 2>&1
