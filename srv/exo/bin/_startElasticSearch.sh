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

echo "[INFO] ======================================="
echo "[INFO] Starting ElasticSearch server on ${HOSTNAME}..."
echo "[INFO] ======================================="
echo ""
ACTION=start  
sudo systemctl ${ACTION} elasticsearch
echo "[INFO] Done"