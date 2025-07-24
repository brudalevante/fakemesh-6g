# Copyright (C) 2024 brudalevante
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-usteer2
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=brudalevante

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-usteer2
  CATEGORY:=X
  SUBMENU:=Configuration Fake Mesh Support
  TITLE:=LuCI Support for usteer2
  PKGARCH:=all
  DEPENDS:=+jsonfilter +umdns +firewall4
endef

define Package/luci-app-usteer2/description
LuCI Support for usteer2.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	# Traducciones (si existen)
	$(foreach po,$(wildcard $(CURDIR)/po/*/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(notdir $(patsubst %.po,%.lmo,$(po)));)
endef

define Package/luci-app-usteer2/install
	# Instalar traducciones (si existen)
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	-$(INSTALL_DATA) $(PKG_BUILD_DIR)/usteer2.*.lmo $(1)/usr/lib/lua/luci/i18n/

	# Instalar menú JSON moderno
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) ./usr/share/luci/menu.d/luci-app-usteer2.json $(1)/usr/share/luci/menu.d/luci-app-usteer2.json

	# Instalar ACL para permisos LuCI
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) ./usr/share/rpcd/acl.d/luci-app-usteer2.json $(1)/usr/share/rpcd/acl.d/luci-app-usteer2.json

	# Instalar vista JS moderna
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/usteer2
	$(INSTALL_DATA) ./www/luci-static/resources/view/usteer2/usteer2.js $(1)/www/luci-static/resources/view/usteer2/usteer2.js

	# Instalar controlador Lua
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./usr/lib/lua/controller/usteer2.lua $(1)/usr/lib/lua/luci/controller/usteer2.lua
endef

$(eval $(call BuildPackage,luci-app-usteer2))
