#
# system_prop.mk for pyramid
#

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240

# radio
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=rmnet0 \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.telephony.mqanelements=5 \
    ro.telephony.ril_class=HtcMsm8660RIL

# wifi
PRODUCT_PROPERTY_OVERRIDES += \
 wifi.interface=wlan0

# UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# tweaks
PRODUCT_PROPERTY_OVERRIDES += \
     dalvik.vm.dexopt-data-only=1 \
     pm.sleep_mode=1

# Low-RAM optimizations
ADDITIONAL_BUILD_PROPERTIES += \
    ro.config.low_ram=true \
    persist.sys.force_highendgfx=true \
    dalvik.vm.jit.codecachesize=0 \
    config.disable_atlas=true \
    ro.config.max_starting_bg=8 \
    ro.sys.fw.bg_apps_limit=16 \
    ro.sys.fw.use_trim_settings=true \
    ro.sys.fw.empty_app_percent=50 \
    ro.sys.fw.trim_empty_percent=100 \
    ro.sys.fw.trim_cache_percent=100 \
    ro.sys.fw.trim_enable_memory=874512384 \
    ro.sys.fw.bservice_enable=true \
    ro.sys.fw.bservice_limit=5 \
    ro.sys.fw.bservice_age=5000

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    debug.composition.type=dyn \
    debug.egl.hw=1 \
    debug.mdpcomp.logs=0 \
    debug.sf.hw=1 \
    dev.pm.dyn_samplingrate=1 \
    ro.opengles.version=131072 \
    debug.egl.recordable.rgba8888=1

## misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1

# Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

# Thermal
PRODUCT_PROPERTY_OVERRIDES += \
    persist.thermal.monitor=true

# By default, primary storage is physical
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.primary_physical=1

# Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=false

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true \
    camera2.portability.force_api=1
