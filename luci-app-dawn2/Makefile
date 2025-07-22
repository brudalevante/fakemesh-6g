# Copyright (C) 2024 brudalevante
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

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

# Opcional: compila traducciones si algún día tienes archivos .po
define Build/Prepare
	$(foreach po,$(wildcard ${CURDIR}/po/*/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(notdir $(patsubst %.po,%.lmo,$(po)));)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-dawn2/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	-$(INSTALL_DATA) $(PKG_BUILD_DIR)/dawn2.*.lmo $(1)/usr/lib/lua/luci/i18n/
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) ./usr/share/luci/menu.d/luci-app-dawn2.json $(1)/usr/share/luci/menu.d/luci-app-dawn2.json
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	-$(INSTALL_DATA) ./usr/share/rpcd/acl.d/luci-app-dawn2.json $(1)/usr/share/rpcd/acl.d/luci-app-dawn2.json
	$(INSTALL_DIR) $(1)/www/luci-static/resources
	-$(INSTALL_DATA) ./www/luci-static/resources/dawn2-common.js $(1)/www/luci-static/resources/dawn2-common.js
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/dawn2
	$(INSTALL_DATA) ./www/luci-static/resources/view/dawn2/dawn2.js $(1)/www/luci-static/resources/view/dawn2/dawn2.js
endef

$(eval $(call BuildPackage,luci-app-dawn2))
