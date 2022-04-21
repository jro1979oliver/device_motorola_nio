#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        system_ext/etc/permissions/moto-telephony.xml)
            sed -i "s#/system/#/system_ext/#" "${2}"
            ;;
        vendor/lib64/camera/components/com.qti.node.gpu.so)
            sed -i "s/camera.mot.is.coming.cts/vendor.camera.coming.cts/g" "${2}"
            ;;
        vendor/lib64/com.qti.feature2.gs.so)
            sed -i "s/camera.mot.is.coming.cts/vendor.camera.coming.cts/g" "${2}"
            ;;
        vendor/lib64/com.qti.feature2.rt.so)
            sed -i "s/camera.mot.is.coming.cts/vendor.camera.coming.cts/g" "${2}"
            ;;
        vendor/lib64/hw/camera.qcom.so)
            sed -i "s/camera.mot.is.coming.cts/vendor.camera.coming.cts/g" "${2}"
            ;;
        vendor/lib64/hw/com.qti.chi.override.so)
            sed -i "s/camera.mot.is.coming.cts/vendor.camera.coming.cts/g" "${2}"
            ;;
        vendor/lib64/vendor.qti.hardware.camera.postproc@1.0-service-impl.so)
            hexdump -ve '1/1 "%.2X"' "${2}" | sed "s/130A0094/1F2003D5/g" | xxd -r -p > "${EXTRACT_TMP_DIR}/${1##*/}"
            mv "${EXTRACT_TMP_DIR}/${1##*/}" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi
set -e

export DEVICE=nio
export DEVICE_COMMON=sm8250-common
export VENDOR=motorola

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
