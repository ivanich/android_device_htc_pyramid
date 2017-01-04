# Release name
PRODUCT_RELEASE_NAME := pyramid

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540
TARGET_BOOTANIMATION_HALF_RES := true

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/pyramid/device_pyramid.mk)

# Device naming
PRODUCT_DEVICE := pyramid
PRODUCT_NAME := lineage_pyramid
PRODUCT_BRAND := htc
PRODUCT_MODEL := Sensation
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_pyramid BUILD_FINGERPRINT=tmous/htc_pyramid/pyramid:7.1/NDE63P/356011.14:user/release-keys PRIVATE_BUILD_DESC="7.1 NDE63P CL356011 release-keys" BUILD_NUMBER=356011
