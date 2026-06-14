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
TARGET_USES_UEFI := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
QCOM_BOARD_PLATFORMS += sm6150
TARGET_BOARD_PLATFORM := sm6150
TARGET_BOARD_COMMON_PATH := hardware/qcom-caf/sm8150
TARGET_USES_QCOM_BSP := true

# Filesystem

# AVB
BOARD_USES_HWC2 := true
BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA256_RSA4096
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

# Audio
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := true
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SSR := true
BOARD_SUPPORTS_OPENSOURCE_STHAL := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_QCOM_AUDIO := true
BOARD_SUPPORTS_SOUND_TRIGGER_HCI := true
BOARD_QTI_USE_QAF := true
BOARD_QTI_USE_SPKR_PROTECT := true
USE_CUSTOM_AUDIO_POLICY := 1
TARGET_USES_QCOM_MM_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_HAVE_QCOM_BT_IPC := true
QCOM_BT_USE_BTNV := true

# Display


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
BOARD_KERNEL_IMAGE_NAME := Image
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
TARGET_MODULE_ALIASES += \
    adsp_loader_dlkm.ko:audio_adsp_loader.ko \
    apr_dlkm.ko:audio_apr.ko \
    bolero_cdc_dlkm.ko:audio_bolero_cdc.ko \
    hdmi_dlkm.ko:audio_hdmi.ko \
    machine_dlkm.ko:audio_machine_talos.ko \
    mbhc_dlkm.ko:audio_mbhc.ko \
    native_dlkm.ko:audio_native.ko \
    pinctrl_lpi_dlkm.ko:audio_pinctrl_lpi.ko \
    pinctrl_wcd_dlkm.ko:audio_pinctrl_wcd.ko \
    platform_dlkm.ko:audio_platform.ko \
    q6_dlkm.ko:audio_q6.ko \
    q6_notifier_dlkm.ko:audio_q6_notifier.ko \
    q6_pdr_dlkm.ko:audio_q6_pdr.ko \
    rx_macro_dlkm.ko:audio_rx_macro.ko \
    snd_event_dlkm.ko:audio_snd_event.ko \
    stub_dlkm.ko:audio_stub.ko \
    swr_ctrl_dlkm.ko:audio_swr_ctrl.ko \
    swr_dlkm.ko:audio_swr.ko \
    tx_macro_dlkm.ko:audio_tx_macro.ko \
    usf_dlkm.ko:audio_usf.ko \
    va_macro_dlkm.ko:audio_va_macro.ko \
    wcd934x_dlkm.ko:audio_wcd934x.ko \
    wcd937x_dlkm.ko:audio_wcd937x.ko \
    wcd937x_slave_dlkm.ko:audio_wcd937x_slave.ko \
    wcd9xxx_dlkm.ko:audio_wcd9xxx.ko \
    wcd_core_dlkm.ko:audio_wcd_core.ko \
    wcd_spi_dlkm.ko:audio_wcd_spi.ko \
    wglink_dlkm.ko:audio_wglink.ko \
    wsa881x_dlkm.ko:audio_wsa881x.ko \
    wsa_macro_dlkm.ko:audio_wsa_macro.ko

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
