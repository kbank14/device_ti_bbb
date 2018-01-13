# Copyright (C) 2011 The Android Open Source Project
# Copyright (C) 2018 kookeun, kbank1411@gmail.com
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/ti/bbb/device.mk)

PRODUCT_NAME := bbb_sd
PRODUCT_DEVICE := bbb
PRODUCT_BRAND := Android
PRODUCT_MODEL :=  BeagleBone Black on SD card
PRODUCT_MANUFACTURER := TI
