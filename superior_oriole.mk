# Inherit some common stuff.
$(call inherit-product, vendor/superior/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/google/gs101/superior_common.mk)
$(call inherit-product, device/google/raviole/oriole/device-superior.mk)
$(call inherit-product, device/google/raviole/aosp_oriole.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := superior_oriole
PRODUCT_MODEL := Pixel 6
PRODUCT_BRAND := google

#SUperiorOS configs
SUPERIOR_GAPPS := full
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true

# Charging Animation
TARGET_INCLUDE_PIXEL_CHARGER := true

# Disable/Enable Blur Support, default is false
TARGET_ENABLE_BLUR := true

#Udfps Stuff
SUPERIOR_UDFPS_ANIMATIONS := true

# Superior OS Official
SUPERIOR_OFFICIAL := true

# Superior Prebuilts
USE_QUICKPIC := true
USE_DUCKDUCKGO := true
USE_MOTO_CALCULATOR := true

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=oriole \
    PRIVATE_BUILD_DESC="oriole-user 13 TQ3A.230805.001 10316531 release-keys"

BUILD_FINGERPRINT := google/oriole/oriole:13/TQ3A.230805.001/10316531:user/release-keys

PRODUCT_RESTRICT_VENDOR_FILES := false

$(call inherit-product, vendor/google/oriole/oriole-vendor.mk)
