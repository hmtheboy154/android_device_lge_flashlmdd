#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/lge/flashlmdd

# Inherit from common tree
$(call inherit-product, device/lge/sm8150-common/sm8150.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 560dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Bootanimation
TARGET_SCREEN_WIDTH := 1440
TARGET_SCREEN_HEIGHT := 3120

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_effects_tune.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects_tune.xml \
    $(DEVICE_PATH)/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(DEVICE_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(DEVICE_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(DEVICE_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(DEVICE_PATH)/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml

# Keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/keylayout/Vendor_1004_Product_637a.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_1004_Product_637a.kl \
    $(DEVICE_PATH)/keylayout/touch_dev_2nd.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/touch_dev_2nd.idc

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.lge

# Media
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml

# NFC
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/nfc/libnfc-nxp-hk.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-hk.conf \
    $(DEVICE_PATH)/nfc/libnfc-nxp-KR.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-KR.conf \
    $(DEVICE_PATH)/nfc/libnfc-nxp-lg.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-lg.conf \
    $(DEVICE_PATH)/nfc/libnfc-nxp-SG.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-SG.conf \
    $(DEVICE_PATH)/nfc/libnfc-nxp-US.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-US.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml

# Shipping API Level
PRODUCT_SHIPPING_API_LEVEL := 28

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/lge/flashlmdd/flashlmdd-vendor.mk)
