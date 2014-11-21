# Copyright 2006 The Android Open Source Project

ifeq ($(BOARD_PROVIDES_LIBRIL),true)
ifeq ($(TARGET_BOARD_PLATFORM),msm8660)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    ril.cpp \
    ril_event.cpp

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libutils \
    libbinder \
    libcutils \
    libhardware_legacy \
    librilutils

#LOCAL_CFLAGS := -DANDROID_MULTI_SIM -DDSDA_RILD1
LOCAL_CFLAGS :=
ifdef BOARD_USE_NEW_LIBRIL_HTC
    LOCAL_CFLAGS += -DNEW_LIBRIL_HTC
endif

ifeq ($(SIM_COUNT), 2)
    LOCAL_CFLAGS += -DANDROID_SIM_COUNT_2
endif

ifeq ($(BOARD_USES_LEGACY_RIL),true)
LOCAL_CFLAGS += -DLEGACY_RIL
endif

LOCAL_MODULE:= libril

include $(BUILD_SHARED_LIBRARY)


endif # TARGET_BOARD_PLATFORM
endif # BOARD_PROVIDES_LIBRIL
