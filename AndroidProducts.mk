#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES += \
    $(LOCAL_DIR)/bliss_flashlmdd.mk

COMMON_LUNCH_CHOICES := \
    bliss_flashlmdd-eng \
    bliss_flashlmdd-user \
    bliss_flashlmdd-userdebug
