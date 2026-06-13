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

COMMON_PATH ?= device/motorola/sm6150-common

BOARD_VENDOR := motorola

# Architecture (64-bit Architecture)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

# Architecture (32-bit Architecture)
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a76

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := sm6150
TARGET_BOARD_PLATFORM := sm6150
BOARD_USES_QCOM_HARDWARE := true

# Platform
QCOM_BOARD_PLATFORMS += sm6150
TARGET_BOARD_COMMON_PATH := hardware/qcom-caf/sm8150

# Filesystem

# AVB
BOARD_USES_HWC2 := true
BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA256_RSA4096
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

# Audio

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_HAVE_QCOM_BT_IPC := true
QCOM_BT_USE_BTNV := true



# Dynamic Partitions
BOARD_USES_DYNAMIC_PARTITIONS := true

# Dynamic Partitions Groups
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions

# Dynamic Partitions List
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := \
	system \
	system_ext \
	product \
	vendor

# Init

# Kernel - Bootimage
BOARD_MKBOOTIMG_ARGS := \
	--ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
	--tags_offset $(BOARD_KERNEL_TAGS_OFFSET) \
	--header_version $(BOARD_BOOT_HEADER_VERSION) \
	--dtb_offset $(BOARD_DTB_OFFSET)

# Kernel configuration
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/motorola/sm6150

# Kernel parameters
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_DTB_OFFSET := 0x01f00000
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Kernel command line
BOARD_KERNEL_CMDLINE := \
	console=ttyMSM0,115200n8 \
	androidboot.console=ttyMSM0 \
	androidboot.hardware=qcom \
	androidboot.memcg=1 \
	lpm_levels.sleep_disabled=1 \
	video=vfb:640x400,bpp=32,memsize=3072000 \
	msm_rtb.filter=0x237 \
	service_locator.enable=1 \
	swiotlb=1 \
	androidboot.usbcontroller=a600000.dwc3 \
	earlycon=msm_geni_serial,0x880000 \
	loop.max_part=7 \
	printk.devkmsg=on \
	firmware_class.path=/vendor/firmware_mnt/image

BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# Kernel modules - Audio

# Kernel modules - Bluetooth

# Kernel modules - Display

# Kernel modules - Camera

# Kernel modules - WLAN

# Lights

# Ramdisk
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_ROOT_EXTRA_SYMLINKS :=

# Partitions - System

# Partitions - Recovery

# Partitions - ODM

# Partitions - Vendor

# Security

# RIL Service

# Sepolicy

# GPS

# Sensors

# Display

# Wifi

# VINTF

# Inherit from the proprietary version
include vendor/motorola/sm6150-common/BoardConfigVendor.mk
