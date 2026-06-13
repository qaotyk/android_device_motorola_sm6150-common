# Copyright (C) 2026 The Android Open Source Project
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

# Inherit relevant product makefiles
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    update-engine \
    update_engine_sideload \
    update_verifier \
    otapreopt_script

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# ANT+

# Biometrics

# Audio - Amplifier

# Audio - HAL

# Audio - Bluetooth

# Audio - Configs

# Bootctrl

# Camera

# Configstore

# Dalvik

# Debugfs

# Display - Graphics

# Display - Hardware

# DRM

# EGL

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Init

# Lights

# Media

# Mount

# Overlay

# Partitions
PRODUCT_PRODUCT_VNDK_VERSION := current
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := strict

# Profiles

# Public Libraries

# RIL

# Security

# Sensors

# Settings

# SurfaceFlinger

# USB

# Vibrator

# VINTF

# Wifi

# Get non-opensource specific aspects
$(call inherit-product, vendor/motorola/sm6150-common/sm6150-common-vendor.mk)
