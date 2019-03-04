#!/bin/bash -eu

# #############################################################################
# Initialize
# #############################################################################                                              
SCRIPT_NAME="${0##*/}"
SCRIPT_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Load env settings
source ${SCRIPT_DIR}/_setenv.sh
# Load common functions
source ${SCRIPT_DIR}/_functions.sh

echo "[INFO] ======================================="
echo "[INFO] Starting ElasticSearch server on ${HOSTNAME}..."
echo "[INFO] ======================================="

if [ -e /usr/lib/systemd/system/elasticsearch.service ]; then

  echo ""
  ACTION=start  
  sudo systemctl ${ACTION} elasticsearch
fi
echo "[INFO] Done"