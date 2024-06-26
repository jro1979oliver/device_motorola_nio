#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from nio device
$(call inherit-product, device/motorola/nio/device.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_nio
PRODUCT_DEVICE := nio
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g(100)
PRODUCT_MANUFACTURER := motorola

PRODUCT_SYSTEM_NAME := nio_retail

# Build info
BUILD_FINGERPRINT := "motorola/nio_retail/nio:12/S1RTS32.41-20-16-1-3/22842-f0a4cf:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="nio_retail-user 12 S1RTS32.41-20-16-1-3 22842-f0a4cf release-keys" \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

# Rising flags
RISING_MAINTAINER := jro1979oliver
WITH_GMS := true
TARGET_PREBUILT_GOOGLE_CAMERA := false
TARGET_ENABLE_BLUR := true
PRODUCT_BUILD_PROP_OVERRIDES += \
    RISING_MAINTAINER="jro1979oliver"
    RISING_CHIPSET="kona"
