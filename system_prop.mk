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
     dalvik.vm.dexopt-flags=m=y \
     windowsmgr.max_events_per_sec=300 \
     pm.sleep_mode=1

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
