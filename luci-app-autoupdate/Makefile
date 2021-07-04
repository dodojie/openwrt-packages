# Copyright (C) 2020-2021 Hyy2001X <https://github.com/Hyy2001X>

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Support for AutoBuild Firmware
LUCI_DEPENDS:=+curl +wget-ssl +bash
LUCI_PKGARCH:=all
PKG_VERSION:=1
PKG_RELEASE:=20210704

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature