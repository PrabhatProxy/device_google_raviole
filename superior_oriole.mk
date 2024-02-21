#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common Lineage stuff.
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/superior/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/google/raviole/aosp_oriole.mk)
$(call inherit-product, device/google/gs101/lineage_common.mk)

include device/google/raviole/oriole/device-lineage.mk

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 6
PRODUCT_NAME := superior_oriole

# Boot animation
TARGET_BOOT_ANIMATION_RES := 1080

# Gapps
BUILD_WITH_GAPPS := true

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=oriole \
    PRIVATE_BUILD_DESC="oriole-user 14 UQ1A.240205.002 11224170 release-keys"

BUILD_FINGERPRINT := google/oriole/oriole:14/UQ1A.240205.002/11224170:user/release-keys

$(call inherit-product, vendor/google/oriole/oriole-vendor.mk)
