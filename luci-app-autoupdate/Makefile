# Copyright (C) 2020-2021 Hyy2001X <https://github.com/Hyy2001X>

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Support for AutoBuild Firmware
LUCI_DEPENDS:=+wget-ssl +bash
LUCI_PKGARCH:=all
PKG_VERSION:=1
PKG_RELEASE:=20210809

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature