# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

LOCAL_PATH := device/htc/pyramid
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

BOARD_VENDOR := htc


# Bootloader
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := scorpion
ARCH_ARM_HAVE_TLS_REGISTER := true

# Flags
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DHTCLOG
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Audio
COMMON_GLOBAL_CFLAGS += -DHTC_ACOUSTIC_AUDIO -DLEGACY_QCOM_VOICE
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_QCOM_TUNNEL_LPA_ENABLED := true

# Camera
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
USE_DEVICE_SPECIFIC_CAMERA := true
BOARD_CAMERA_FRONT_VGA := true

# FM Radio
# 4.2 -> commenting these for audio policy
#BOARD_HAVE_QCOM_FM := true
#COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED

# GPS
TARGET_GPS_HAL_PATH := $(LOCAL_PATH)/gps
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000


# Graphics
USE_OPENGL_RENDERER := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_EGL_CFG := device/htc/pyramid/configs/egl.cfg
TARGET_DISPLAY_INSECURE_MM_HEAP := true

# Media
TARGET_NO_ADAPTIVE_PLAYBACK := true

# Use CM PowerHAL
TARGET_POWERHAL_VARIANT := cm

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := pyramid

# Kernel
BOARD_KERNEL_BASE := 0x48000000
BOARD_KERNEL_PAGE_SIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0 androidboot.hardware=pyramid no_console_suspend=1 androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01400000
TARGET_KERNEL_CONFIG := pyramid_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/pyramid

TARGET_RECOVERY_FSTAB := device/htc/pyramid/rootdir/etc/fstab.pyramid
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
RECOVERY_GRAPHICS_USE_LINELENGTH := true

# Required for Sensors
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Charge mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode

# Lights
TARGET_HAS_NO_BLUE_LED := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/pyramid/bluetooth/include
BOARD_BLUEDROID_VENDOR_CONF := device/htc/pyramid/bluetooth/vnd_pyramid.txt
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false

# Bluetooth/Wifi
-include device/htc/pyramid/bcmdhd.mk

# Hardware tunables
BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw

# Misc
BOARD_USES_LEGACY_MMAP := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_VOLD_MAX_PARTITIONS := 36
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838859776
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1252770816
BOARD_FLASH_BLOCK_SIZE := 262144

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),userdebug)
   ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
   endif
  endif
endif
DONT_DEXPREOPT_PREBUILTS := true

# Twrp
DEVICE_RESOLUTION = 540x960
BOARD_HAS_NO_REAL_SDCARD := false
TW_NO_SCREEN_BLANK := true
TW_INCLUDE_DUMLOCK := true
HAVE_SELINUX := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
