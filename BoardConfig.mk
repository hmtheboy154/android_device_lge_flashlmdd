#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/lge/flashlmdd

# inherit from common tree
-include device/lge/sm8150-common/BoardConfigCommon.mk

# Display
TARGET_SCREEN_DENSITY := 560

# Kernel
TARGET_KERNEL_CONFIG := vendor/lineageos_flash_defconfig

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/recovery/recovery.wipe
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90

# Vendor SPL
VENDOR_SECURITY_PATCH := 2022-08-01

# inherit from the proprietary version
-include vendor/lge/flashlmdd/BoardConfigVendor.mk
