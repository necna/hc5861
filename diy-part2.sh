#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

#固件架构
cat >> .config <<EOF
CONFIG_TARGET_ramips=y
CONFIG_TARGET_ramips_mt7620=y
CONFIG_TARGET_ramips_mt7620_DEVICE_hiwifi_hc5861=y
EOF

#取消默认启用的软件
cat >> .config <<EOF
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
EOF

# 5. Protocols
cat >> .config <<EOF
CONFIG_PACKAGE_luci-proto-relay=y
EOF

#kmod
cat >> .config <<EOF
CONFIG_DEFAULT_kmod-sdhci-mt7620=y
CONFIG_DEFAULT_kmod-usb-ledtrig-usbport=y
CONFIG_DEFAULT_kmod-usb-ohci=y
CONFIG_DEFAULT_kmod-usb2=y
EOF

#
# USB Support
#
cat >> .config <<EOF
CONFIG_PACKAGE_kmod-usb-core=y
CONFIG_PACKAGE_kmod-usb-ehci=y
CONFIG_PACKAGE_kmod-usb-ledtrig-usbport=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y
CONFIG_PACKAGE_kmod-usb2=y
EOF

#
# LuCI
#
cat >> .config <<EOF
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_luci-base=y
CONFIG_LUCI_LANG_zh-cn=y
CONFIG_PACKAGE_luci-compat=y
CONFIG_PACKAGE_luci-mod-admin-full=y
EOF

#使固件支持tf卡扩展
cat >> .config <<EOF
CONFIG_PACKAGE_automount=y
CONFIG_PACKAGE_kmod-nls-cp437=y
CONFIG_PACKAGE_kmod-nls-iso8859-1=y
CONFIG_PACKAGE_kmod-nls-utf8=y
CONFIG_PACKAGE_kmod-sdhci=y
CONFIG_PACKAGE_kmod-sit=y
CONFIG_PACKAGE_block-mount=y
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-vfat=y
EOF

#启用软件
#cat >> .config <<EOF
#EOF

#启用主题
#cat >> .config <<EOF
#EOF