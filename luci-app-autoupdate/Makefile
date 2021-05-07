# Copyright (C) 2020 Hyy2001X <https://github.com/Hyy2001X>

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Support for AutoBuild Firmware
LUCI_DEPENDS:=+curl +wget +bash
LUCI_PKGARCH:=all
PKG_VERSION:=1
PKG_RELEASE:=20210506

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature