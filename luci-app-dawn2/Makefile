#
# Copyright (C) 2024 brudalevante
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-dawn2
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=brudalevante

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-dawn2
	CATEGORY:=X
	SUBMENU:=Configuration Fake Mesh Support
	TITLE:=LuCI Support for dawn2
	PKGARCH:=all
	DEPENDS:=+jsonfilter +umdns +firewall4
endef

define Package/luci-app-dawn2/description
	LuCI Support for dawn2.
endef

define Build/Prepare
	$(foreach po,$(wildcard ${CURDIR}/files/luci/i18n/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(patsubst %.po,%.lmo,$(notdir $(po)));)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-dawn2/conffiles
/etc/config/dawn2
endef

define Package/luci-app-dawn2/postinst
#!/bin/sh
if [ -z "$$IPKG_INSTROOT" ]; then
  ( . /etc/uci-defaults/40_luci-app-dawn2 )
  rm -f /etc/uci-defaults/40_luci-app-dawn2
  ( . /etc/uci-defaults/96-dawn2-defaults )
  rm -f /etc/uci-defaults/96-dawn2-defaults

  rm -rf /tmp/luci-indexcache /tmp/luci-modulecache
fi

exit 0
endef

define Package/luci-app-dawn2/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/dawn2.*.lmo $(1)/usr/lib/lua/luci/i18n/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./root/etc/config/dawn2 $(1)/etc/config/dawn2
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/dawn2 $(1)/etc/init.d/dawn2
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./root/usr/sbin/dawn2 $(1)/usr/sbin/dawn2
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DATA) ./root/etc/uci-defaults/40_luci-app-dawn2 $(1)/etc/uci-defaults/40_luci-app-dawn2
	$(INSTALL_DATA) ./root/etc/uci-defaults/96-dawn2-defaults $(1)/etc/uci-defaults/96-dawn2-defaults
	$(INSTALL_DIR) $(1)/etc/hotplug.d/dhcp/
	$(INSTALL_DATA) ./root/etc/hotplug.d/dhcp/10-dawn2 $(1)/etc/hotplug.d/dhcp/10-dawn2
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface/
	$(INSTALL_DATA) ./root/etc/hotplug.d/iface/19-dawn2 $(1)/etc/hotplug.d/iface/19-dawn2
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) ./root/usr/share/rpcd/acl.d/*.json $(1)/usr/share/rpcd/acl.d/
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) ./root/usr/share/luci/menu.d/*.json $(1)/usr/share/luci/menu.d/
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/dawn2
	$(INSTALL_DATA) ./htdocs/luci-static/resources/view/dawn2/dawn2.js $(1)/www/luci-static/resources/view/dawn2/dawn2.js
	$(INSTALL_DIR) $(1)/usr/share/ucitrack
	$(INSTALL_DATA) ./root/usr/share/ucitrack/*.json $(1)/usr/share/ucitrack/
endef

$(eval $(call BuildPackage,luci-app-dawn2))
