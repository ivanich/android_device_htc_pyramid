# Copyright (C) 2012 The CyanogenMod Project
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

# Copy Bluetooth firmware, since BCM4329 is a BT/WiFi chip
PRODUCT_COPY_FILES += \
    device/htc/pyramid/firmware/bcm4330.hcd:system/vendor/firmware/bcm4330.hcd \
    device/htc/pyramid/firmware/bcm4329.hcd:system/vendor/firmware/bcm4329.hcd
