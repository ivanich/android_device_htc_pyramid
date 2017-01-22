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

TARGET_SPECIFIC_HEADER_PATH += device/htc/pyramid/include

BOARD_VENDOR := htc

# Bootloader
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8660

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := scorpion
TARGET_NEEDS_NON_PIE_SUPPORT := true

# Use Snapdragon LLVM, if available
TARGET_USE_SDCLANG := true

# Flags
BOARD_GLOBAL_CFLAGS += -DQCOM_HARDWARE
BOARD_GLOBAL_CFLAGS += -DQCOM_BSP_LEGACY


# Bionic
MALLOC_SVELTE := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true

# Audio
BOARD_GLOBAL_CFLAGS += -DHTC_ACOUSTIC_AUDIO -DLEGACY_QCOM_VOICE
BOARD_USES_LEGACY_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := false
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := true

# Camera
BOARD_NEEDS_MEMORYHEAPPMEM := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# FM Radio
QCOM_FM_ENABLED := true

# GPS
TARGET_GPS_HAL_PATH := device/htc/pyramid/gps
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000


# Graphics
USE_OPENGL_RENDERER := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
TARGET_DISPLAY_INSECURE_MM_HEAP := true

# Media
TARGET_NO_ADAPTIVE_PLAYBACK := true

# Use CM PowerHAL
TARGET_POWERHAL_VARIANT := qcom

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := pyramid

# Kernel
BOARD_KERNEL_BASE := 0x48000000
BOARD_KERNEL_PAGE_SIZE := 2048
BOARD_KERNEL_CMDLINE := console=none androidboot.hardware=pyramid no_console_suspend=1 androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01400000
TARGET_KERNEL_CONFIG := pyramid_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/pyramid

RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_DEVICE_DIRS += device/htc/pyramid
TARGET_RECOVERY_FSTAB := device/htc/pyramid/rootdir/etc/fstab.pyramid

# Charge mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode

# Lights
TARGET_HAS_NO_BLUE_LED := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/pyramid/bluetooth/include
BOARD_CUSTOM_BT_CONFIG := device/htc/pyramid/bluetooth/vnd_pyramid.txt
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false

# Bluetooth/Wifi
-include device/htc/pyramid/bcmdhd.mk

# Hardware tunables
#BOARD_HARDWARE_CLASS := device/htc/pyramid/cmhw

# RIL
TARGET_RIL_VARIANT := caf
BOARD_RIL_CLASS := ../../../device/htc/pyramid/ril

# Misc
BOARD_USES_LEGACY_MMAP := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_NO_SECURE_DISCARD := true

# Recovery
TARGET_RECOVERY_DEVICE_MODULES += chargeled

# SELinux
-include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/htc/pyramid/sepolicy

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_VOLD_MAX_PARTITIONS := 36
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838859776
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1252770816
BOARD_CACHEIMAGE_PARTITION_SIZE := 125787136
BOARD_FLASH_BLOCK_SIZE := 262144

# Twrp
TW_THEME := portrait_mdpi
TW_INCLUDE_CRYPTO := true
TW_NO_SCREEN_BLANK := true
TW_INCLUDE_DUMLOCK := true
TW_USE_TOYBOX := false
HAVE_SELINUX := true
TW_NO_CPU_TEMP := true
TW_NEW_ION_HEAP := true
TW_INCLUDE_NTFS_3G := true
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"
TW_EXTERNAL_STORAGE_PATH := "/usb-otg"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
