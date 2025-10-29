#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Display
TARGET_USES_Q_DISPLAY_STACK := true

# Platform
TARGET_BOARD_PLATFORM := msm8953

# Inherit from mithorium-common
$(call inherit-product, device/xiaomi/mithorium-common/mithorium.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Dynamic Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    CustomROMsOverlay_oxygen \
    HapticOverlay

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service.xiaomi \
    liblzma.vendor:64

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_fingerprint/android.hardware.fingerprint.xml

# Screen density
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/audio/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml

# Camera
PRODUCT_PACKAGES += \
    camera.msm8953

# Input
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/keylayout/,$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/)

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf

# Recovery
PRODUCT_COPY_FILES += \
    vendor/xiaomi/oxygen/proprietary/vendor/bin/hvdcp_opti:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/hvdcp_opti

# Shims
PRODUCT_PACKAGES += \
    libshims_android \
    libshims_binder \
    libshims_ui \
    libwui

# Rootdir
PRODUCT_PACKAGES += \
    fstab.qcom_ramdisk \
    init.xiaomi.device.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/xiaomi

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/oxygen/oxygen-vendor.mk)
