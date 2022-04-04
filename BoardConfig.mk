#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

include device/motorola/sm8250-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/nio

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := nio

# Display
TARGET_SCREEN_DENSITY := 420

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/framework_compatibility_matrix.xml

# Kernel
TARGET_KERNEL_CONFIG := vendor/lineageos_nio_defconfig

# Kernel Modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Touch
SOONG_CONFIG_NAMESPACES += MOTO_KONA_TOUCH
SOONG_CONFIG_MOTO_KONA_TOUCH := SINGLE_TAP_PATH
SOONG_CONFIG_MOTO_KONA_TOUCH_SINGLE_TAP_PATH := /sys/class/touchscreen/NVT-ts/single_click
TARGET_TAP_TO_WAKE_NODE := /sys/class/touchscreen/NVT-ts/double_click

# Inherit from the proprietary version
-include vendor/motorola/nio/BoardConfigVendor.mk
