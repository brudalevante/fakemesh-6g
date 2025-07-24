# Copyright (C) 2024 brudalevante
# This is free software, licensed under the GNU General Public License v3.

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/luci.mk

PKG_NAME:=luci-app-fakemesh
PKG_VERSION:=1.0.2
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=brudalevante

define Package/$(PKG_NAME)
  CATEGORY:=Network
  SUBMENU:=Mesh
  TITLE:=LuCI Support for fakemesh
  PKGARCH:=all
  DEPENDS:=+luci-base +jsonfilter +umdns +firewall4
  MENU:=1
endef

define Package/$(PKG_NAME)/description
LuCI Support for fakemesh.
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/fakemesh
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	-$(INSTALL_DATA) ./po/*.lmo $(1)/usr/lib/lua/luci/i18n/ 2>/dev/null || true

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./root/etc/config/fakemesh $(1)/etc/config/fakemesh
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/fakemesh $(1)/etc/init.d/fakemesh
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./root/usr/sbin/fakemesh $(1)/usr/sbin/fakemesh
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DATA) ./root/etc/uci-defaults/40_luci-app-fakemesh $(1)/etc/uci-defaults/40_luci-app-fakemesh
	$(INSTALL_DATA) ./root/etc/uci-defaults/96-fakemesh-defaults $(1)/etc/uci-defaults/96-fakemesh-defaults
	$(INSTALL_DIR) $(1)/etc/hotplug.d/dhcp/
	$(INSTALL_DATA) ./root/etc/hotplug.d/dhcp/10-fakemesh $(1)/etc/hotplug.d/dhcp/10-fakemesh
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface/
	$(INSTALL_DATA) ./root/etc/hotplug.d/iface/19-fakemesh $(1)/etc/hotplug.d/iface/19-fakemesh

	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) ./root/usr/share/rpcd/acl.d/*.json $(1)/usr/share/rpcd/acl.d/
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) ./root/usr/share/luci/menu.d/*.json $(1)/usr/share/luci/menu.d/
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/fakemesh
	$(INSTALL_DATA) ./htdocs/luci-static/resources/view/fakemesh/fakemesh.js $(1)/www/luci-static/resources/view/fakemesh/fakemesh.js
	$(INSTALL_DIR) $(1)/usr/share/ucitrack
	$(INSTALL_DATA) ./root/usr/share/ucitrack/*.json $(1)/usr/share/ucitrack/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
