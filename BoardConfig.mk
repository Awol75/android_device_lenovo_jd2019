#
# Copyright (C) 2018-2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BOARD_VENDOR := lenovo

DEVICE_PATH := device/lenovo/jd2019
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := kryo

TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm710
TARGET_NO_BOOTLOADER := true

# FM
BOARD_HAS_QCA_FM_SOC := "cherokee"
BOARD_HAVE_QCOM_FM := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0xA90000 androidboot.hardware=qcom androidboot.console=ttyMSM0 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 service_locator.enable=1 androidboot.configfs=true androidboot.usbcontroller=a600000.dwc3 swiotlb=1 firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000

BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/lenovo/sdm710
TARGET_KERNEL_CONFIG := jd2019_defconfig

# Platform
TARGET_BOARD_PLATFORM := sdm710
TARGET_BOARD_PLATFORM_GPU := qcom-adreno616

# Assert
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt
TARGET_OTA_ASSERT_DEVICE := jd2019

# Audio
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth/include
BOARD_HAVE_BLUETOOTH_QCOM := true
TARGET_USE_QTI_BT_STACK := true

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true

# Charger Mode
BOARD_CHARGER_ENABLE_SUSPEND := true

# Dex
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT ?= true
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= true
PRODUCT_DEXPREOPT_SPEED_APPS += SystemUI

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# Graphics
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

VSYNC_EVENT_PHASE_OFFSET_NS := 2000000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 6000000

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5368709120
BOARD_USERDATAIMAGE_PARTITION_SIZE := 54416866304
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824

BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_FLASH_BLOCK_SIZE := 262144						# (BOARD_KERNEL_PAGESIZE * 64)

BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/persist:/persist \
    /vendor/bt_firmware:/bt_firmware \
    /vendor/dsp:/dsp \
    /vendor/firmware_mnt:/firmware

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
TARGET_USES_MKE2FS := true

TARGET_COPY_OUT_VENDOR := vendor

# Power
TARGET_HAS_NO_WLAN_STATS := true
TARGET_TAP_TO_WAKE_NODE := "/sys/devices/virtual/touch/tp_dev/gesture_on"
TARGET_USES_INTERACTION_BOOST := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# QCOM
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# RenderScript
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_jd2019
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# RIL
ENABLE_VENDOR_RIL_SERVICE := true
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true
#TARGET_RIL_VARIANT := caf
TARGET_USES_OLD_MNC_FORMAT := true

# Security patch level
VENDOR_SECURITY_PATCH := 2019-04-05

# Sepolicy
include device/qcom/sepolicy/sepolicy.mk
#BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# System-as-root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Treble
BOARD_VNDK_VERSION := current
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Verified Boot
BOARD_AVB_ENABLE := false
#BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flag 2
BOARD_BUILD_DISABLED_VBMETAIMAGE := true

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

BOARD_VENDOR_KERNEL_MODULES += \
$(DEVICE_PATH)/modules/adsp_loader_dlkm.ko \
$(DEVICE_PATH)/modules/analog_cdc_dlkm.ko \
$(DEVICE_PATH)/modules/apr_dlkm.ko \
$(DEVICE_PATH)/modules/cpe_lsm_dlkm.ko \
$(DEVICE_PATH)/modules/cs35l41_dlkm.ko \
$(DEVICE_PATH)/modules/digital_cdc_dlkm.ko \
$(DEVICE_PATH)/modules/hdmi_dlkm.ko \
$(DEVICE_PATH)/modules/machine_dlkm.ko \
$(DEVICE_PATH)/modules/mbhc_dlkm.ko \
$(DEVICE_PATH)/modules/msm_sdw_dlkm.ko \
$(DEVICE_PATH)/modules/native_dlkm.ko \
$(DEVICE_PATH)/modules/pinctrl_lpi_dlkm.ko \
$(DEVICE_PATH)/modules/pinctrl_wcd_dlkm.ko \
$(DEVICE_PATH)/modules/platform_dlkm.ko \
$(DEVICE_PATH)/modules/q6_dlkm.ko \
$(DEVICE_PATH)/modules/q6_notifier_dlkm.ko \
$(DEVICE_PATH)/modules/q6_pdr_dlkm.ko \
$(DEVICE_PATH)/modules/stub_dlkm.ko \
$(DEVICE_PATH)/modules/swr_dlkm.ko \
$(DEVICE_PATH)/modules/swr_ctrl_dlkm.ko \
$(DEVICE_PATH)/modules/usf_dlkm.ko \
$(DEVICE_PATH)/modules/wcd9335_dlkm.ko \
$(DEVICE_PATH)/modules/wcd934x_dlkm.ko \
$(DEVICE_PATH)/modules/wcd9xxx_dlkm.ko \
$(DEVICE_PATH)/modules/wcd_core_dlkm.ko \
$(DEVICE_PATH)/modules/wcd_cpe_dlkm.ko \
$(DEVICE_PATH)/modules/wcd_spi_dlkm.ko \
$(DEVICE_PATH)/modules/wglink_dlkm.ko \
$(DEVICE_PATH)/modules/wsa881x_dlkm.ko

# Inherit from the proprietary version
-include vendor/lenovo/jd2019/BoardConfigVendor.mk
