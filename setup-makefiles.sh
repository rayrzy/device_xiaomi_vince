#!/bin/bash
#
# Copyright (C) The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

# Required!
DEVICE=vince
VENDOR=xiaomi

INITIAL_COPYRIGHT_YEAR=2017

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ROM_ROOT="${MY_DIR}/../../.."

HELPER="${ROM_ROOT}/vendor/havoc/build/tools/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ROM_ROOT}"

# Copyright headers and guards
write_headers

write_makefiles "${MY_DIR}/proprietary-files.txt" true

# Finish
write_footers
