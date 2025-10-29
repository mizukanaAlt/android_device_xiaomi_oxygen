#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from oxygen device
$(call inherit-product, device/xiaomi/oxygen/device.mk)

# Kernel
TARGET_KERNEL_VERSION := 4.9

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := oxygen
PRODUCT_NAME := lineage_oxygen
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := MI MAX 2
PRODUCT_MANUFACTURER := Xiaomi

# Build Name
BUILD_USERNAME := RenzAlt
BUILD_HOSTNAME := nigo-at25

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="oxygen-user 7.1.1 NMF26F V11.0.2.0.NDDMIXM release-keys" \
    BuildFingerprint=google/walleye/walleye:8.1.0/OPM1.171019.011/4448085:user/release-keys
